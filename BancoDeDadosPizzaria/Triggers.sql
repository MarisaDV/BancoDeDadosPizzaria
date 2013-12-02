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