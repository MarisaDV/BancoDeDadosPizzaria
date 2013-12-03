/* ****************************************************************************** *
*  Verifica quando houver um INSERT na Produtos_Pedidos e decrementa a quantida-  *
*  de do produto no estoque.
* ******************************************************************************* */
CREATE TRIGGER tg_Produtos_Pedidos
ON Produtos_Pedidos
AFTER INSERT
AS
		BEGIN
			-- Declara as variaveis a ser utilizada dentro da TRIGGER.
			DECLARE @idPedido INT
			DECLARE @idProduto INT
			DECLARE @idEstoque INT
			
			-- Atribui o código do pedido a variavel.
			SET @idPedido = (SELECT inserted.idPedido FROM inserted)

			-- Atribui a variavel @DataLocacao o valor da data de locacao da tabela locacao.
			SET @idProduto = (SELECT inserted.idProduto FROM inserted)
												
			DECLARE @cursorEstoque CURSOR;
			
			SET @cursorEstoque = CURSOR FOR
					SELECT e.idEstoque, e.Quantidade, i.Qtd
						FROM Estoques e
						INNER JOIN Ingredientes i
						ON e.idEstoque = i.idEstoque
						WHERE i.idProduto = @idProduto;
						
			DECLARE @ESTOQUE INT;
			DECLARE @ESTOQUE_QUANTIDADE INT;
			DECLARE @INGREDIENTES_QUANTIDADE INT;
			
			OPEN @cursorEstoque;
			
			IF(CURSOR_STATUS('variable','@cursorEstoque') = 1)
			BEGIN
				FETCH NEXT FROM @cursorEstoque INTO
				@ESTOQUE, @ESTOQUE_QUANTIDADE, @INGREDIENTES_QUANTIDADE;
				
				WHILE (@@FETCH_STATUS = 0)
				BEGIN
				
				UPDATE Estoques SET Quantidade = @ESTOQUE_QUANTIDADE - @INGREDIENTES_QUANTIDADE
				WHERE idEstoque = @ESTOQUE;
				
				FETCH NEXT FROM @cursorEstoque INTO
				@ESTOQUE, @ESTOQUE_QUANTIDADE, @INGREDIENTES_QUANTIDADE;
				END
			END
					
			CLOSE @cursorEstoque;
			DEALLOCATE @cursorEstoque;
		END
GO

/* Select para verificar se a trigger foi executada com sucesso. */

SELECT * FROM Produtos_Pedidos;

INSERT INTO Produtos_Pedidos VALUES (1, 1);


SELECT * FROM Estoques e
INNER JOIN Ingredientes i
ON e.idEstoque = i.idEstoque
WHERE i.idProduto = 3
												
SELECT * FROM Estoques
SELECT * FROM Ingredientes


/* ****************************************************************************** *
*  Verifica quando houver um INSERT, UPDATE e DELETE na Pedidos e armazena a 			*
*  operação executada na tabela de logs.																					*
* ******************************************************************************* */
CREATE TRIGGER tg_PEDIDOS_LOG
ON Pedidos FOR INSERT, UPDATE, DELETE
AS
	-- @idPedido: Variável que armazenará os registros afetados
	-- por uma instrução INSERT, UPDATE, DELETE.  
	DECLARE @idPedido INT;
	DECLARE @CPF VARCHAR(11);
	
	-- @Acao: Indicará a instrução feita (INSERT, UPDATE, DELETE).
	DECLARE @Acao NVARCHAR(10);
	
	-- @@CursorPEDIDOS: CURSOR que fará com que seja manipulado
	-- registro por registro de uma tabela, podendo ser 
	-- a tabelas temporárias inserted ou deleted
	DECLARE @CursorPEDIDOS CURSOR;
	
	-- Condição que verifica se há regitros na tabela inserted e não há
	-- registros na tabela deleted, o que caracteriza uma instrução INSERT.
	-- Se houver registros na tabela inserted e houver registros na tabela
	-- deleted, caracteriza uma instrução UPDATE. Caso contrário, não há
	-- registros na tabela inserted e há registros na tabela deleted,
	-- caracterizando uma instrução DELETE. 
	-- Dependendo da condição, atribui uma determinada instrução SELECT 
	-- para o cursor @CursorCLIENTE e atribui uma ação à variável @Acao 
	IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
		BEGIN					
			SET @CursorPEDIDOS = CURSOR FOR SELECT idPedido, CPF FROM inserted;
			SET @Acao = 'INSERT';
			OPEN @CursorPEDIDOS;					
		END		
	ELSE IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
		BEGIN
			SET @CursorPEDIDOS = CURSOR FOR SELECT idPedido, CPF FROM deleted;
			SET @Acao = 'UPDATE';
			OPEN @CursorPEDIDOS;
		END	
	ELSE IF NOT EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
		BEGIN
			SET @CursorPEDIDOS = CURSOR FOR SELECT idPedido, CPF FROM deleted;
			SET @Acao = 'DELETE';
			OPEN @CursorPEDIDOS;
		END	
	
	-- CURSOR_STATUS: Função que verifica o status da variával cursor @CursorCLIENTE
	-- retornando 1 caso ele esteja aberto(open), 0 caso não esteja atribuido nenhuma
	-- instrução SELECT, -1 caso esteja fechado(close), entre outros.	
	IF(CURSOR_STATUS('variable','@CursorPEDIDOS') = 1)
	BEGIN				
		-- Obtem o próximo registro do cursor @CursorCLIENTE e
		-- armazena na variável @cod_CLIENTE
		FETCH NEXT FROM @CursorPEDIDOS INTO @idPedido, @CPF
		
		-- Laço que irá executar enquanto a variável @@FETCH_STATUS for
		-- igual a 0, o que indica que ainda há registros no cursor @CursorCLIENTE,
		-- quando não houver registros a variável @@FETCH_STATUS será igual a -1.
		WHILE (@@FETCH_STATUS = 0)
		BEGIN
			INSERT INTO Logs (DescAtividade, DataHora, Tabela, CPF)
			VALUES (@Acao + ':' + CONVERT(VARCHAR, @idPedido), GETDATE(), 'Pedidos', @CPF);				
			
			FETCH NEXT FROM @CursorPEDIDOS INTO @idPedido, @CPF;
		END
		
		-- Desaloca o cursor da memória.
		CLOSE @CursorPEDIDOS;
		
		-- Remove as todas referências do cursor.
		DEALLOCATE @CursorPEDIDOS;
	END	
GO

/* Select para verificar se a trigger foi executada com sucesso. */


SELECT * FROM Pedidos

INSERT INTO Pedidos VALUES 
		(15, '05-12-2013', 1, '12332112363', 'AV Andrômeda, 720, Centro.');
		
		DELETE FROM Pedidos WHERE idPedido = 15;
		
SELECT * FROM Logs;