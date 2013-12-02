/* ****************************************************************************** *
*  Verifica quando houver um INSERT na Produtos_Pedidos e decrementa a quantida-  *
*  de do produto no estoque.
* ******************************************************************************* */
CREATE TRIGGER tg_Produtos_Pedidos
ON Produtos_Pedidos, INSERT
AS
		BEGIN
			-- Declara as variaveis a ser utilizada dentro da TRIGGER.
			DECLARE @idPedido INT
			DECLARE @idProduto INT
			DECLARE @idEstoque INT
			
			-- Atribui o código do pedido a variavel.
			SET @idPedido = (	SELECT Produtos_Pedidos.idPedido 
												FROM Produtos_Pedidos
												INNER JOIN inserted
												ON inserted.idPedido = Produtos_Pedidos.idPedido)

			-- Atribui a variavel @DataLocacao o valor da data de locacao da tabela locacao.
			SET @idProduto = (SELECT Produtos_Pedidos.idProduto
												FROM Produtos_Pedidos
												INNER JOIN inserted
												ON inserted.idProduto = Produtos_Pedidos.idProduto)

			SET @idEstoque = (SELECT Estoque.idEstoque
												FROM Estoque e
												INNER JOIN Ingredientes i
												ON e.idEstoque = i.idEstoque
												INNER JOIN inserted pp
												ON i.idPedido =  pp.idPedido)
					
			PRINT('DEVOLUCAO SUJEITA A MULTA!')
			PRINT('--------------------')
			PRINT('Valor da Locação: ')
			PRINT('Valor da Multa: ') 
			PRINT('--------------------')
			PRINT('Total: ') 
		END
GO