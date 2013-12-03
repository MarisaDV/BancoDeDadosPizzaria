USE Pizzaria
GO

IF EXISTS (select name from sys.procedures where name = 'usp_idadeFuncionarios')
        DROP PROCEDURE usp_idadeFuncionarios
GO

CREATE PROCEDURE usp_idadeFuncionarios
AS
	SELECT Nome, DATEDIFF(YEAR, DataNascimento, GETDATE()) - CASE 
					WHEN GETDATE() < DATEADD(YEAR, DATEDIFF(YEAR,DataNascimento, GETDATE()),DataNascimento)
						THEN 1
						ELSE 0
					END AS 'Idade',  CONVERT(VARCHAR(10),DataNascimento, 103) As 'Data de Nascimento'
	FROM Funcionarios
GO

EXEC usp_idadeFuncionarios
GO

IF EXISTS (select name from sys.procedures where name = 'usp_pedidosRealizados')
        DROP PROCEDURE usp_pedidosRealizados
GO

-- Pedidos entregues 
CREATE PROCEDURE usp_pedidosRealizados
	@nome VARCHAR(45)
AS
	SELECT F.Nome, C.NomeCargo as 'Cargo', Prod.Nome, CONVERT(VARCHAR(10),P.data, 103) As 'Data do Pedido'  FROM Funcionarios F
        INNER JOIN Cargos C ON C.idCargo = F.idCargo
        INNER JOIN Pedidos P ON P.CPF = F.CPF
        INNER JOIN Produtos_Pedidos PP ON PP.idPedido = P.idPedido
        INNER JOIN Produtos Prod ON Prod.idProduto = PP.idProduto
        WHERE F.Nome = @nome     
GO


IF EXISTS (select name from sys.procedures where name = 'usp_pedidosRealizadosCliente')
        DROP PROCEDURE usp_pedidosRealizadosCliente
GO

-- Pedidos do cliente  
CREATE PROCEDURE usp_pedidosRealizadosCliente
	@nome VARCHAR(45)
AS
	SELECT Cli.Nome,  Prod.Nome, CONVERT(VARCHAR(10),P.data, 103) As 'Data do Pedido'  FROM 
		Clientes Cli
        INNER JOIN Pedidos P ON P.idCliente = Cli.idCliente
        INNER JOIN Produtos_Pedidos PP ON PP.idPedido = P.idPedido
        INNER JOIN Produtos Prod ON Prod.idProduto = PP.idProduto
        WHERE Cli.Nome = @nome     
GO

EXEC usp_pedidosRealizadosCliente 'Robervaldo'
GO
EXEC usp_pedidosRealizadosCliente 'Valdomiro'
GO
