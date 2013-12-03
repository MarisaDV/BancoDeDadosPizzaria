USE Pizzaria
go

SELECT * FROM Ingredientes
GO

-- -----------------------------------------------------
-- Lista alimentos e seus fornecedores
-- -----------------------------------------------------    
SELECT  Estoques.Produto as [Alimento], 
        Fornecedores.Nome as [Fornecedor] 
    FROM Estoques_Fornecedores
	    INNER JOIN Estoques ON 
	        Estoques.idEstoque = Estoques_Fornecedores.idEstoque 
	    INNER JOIN Fornecedores ON 
	        Fornecedores.idFornecedor = Estoques_Fornecedores.idFornecedor
	ORDER BY Fornecedores.Nome, Estoques.Produto
GO


-- -----------------------------------------------------
-- Lista os nomes dos produtos, seus ingredientes e a
-- quantidade em estoque
-- -----------------------------------------------------
SELECT  Produtos.Nome, 
        Estoques.Produto, 
        Estoques.Quantidade 
    FROM Ingredientes
	    INNER JOIN Produtos ON 
	        Produtos.idProduto = Ingredientes.idProduto 
    	INNER JOIN Estoques ON 
        	Estoques.idEstoque = Ingredientes.idEstoque 
	ORDER BY Produtos.Nome, Estoques.Produto
GO

-- -----------------------------------------------------
-- Lista os clientes e os logins de quem o tiver.
-- -----------------------------------------------------
CREATE VIEW ClientesComLogin
AS
	SELECT  Logins.Usuario, 
    	Clientes.idCliente FROM Logins
	    	RIGHT JOIN Clientes ON 
    	Logins.idLogin = Clientes.idLogin 
GO

-- -----------------------------------------------------
-- Lista produtos pedidos
-- -----------------------------------------------------
CREATE VIEW PedidosRealizados
AS 
	SELECT  Produtos.Nome AS [Produto], 
	        Pedidos.idCliente 
        FROM Produtos_Pedidos
		    INNER JOIN Produtos ON 
		        Produtos.idProduto = Produtos_Pedidos.idProduto 
		    INNER JOIN Pedidos ON 
		        Pedidos.idPedido = Produtos_Pedidos.idPedido 
GO

-- -----------------------------------------------------
-- Lista dos clientes que fizeram pedidos.
-- -----------------------------------------------------
CREATE VIEW ClientesQueFizeramPedidos
AS
SELECT	ClientesComLogin.Usuario,
		PedidosRealizados.Produto
		 FROM PedidosRealizados
	INNER JOIN ClientesComLogin ON 
	    ClientesComLogin.idCliente = PedidosRealizados.idCliente
GO	

SELECT  ClientesQueFizeramPedidos.Usuario, 
        COUNT(*) AS [Quantidade de Pedidos] 
    FROM ClientesQueFizeramPedidos 
	    GROUP BY ClientesQueFizeramPedidos.Usuario

-- -----------------------------------------------------
-- Clientes e seus dependentes
-- -----------------------------------------------------
SELECT  ClientesComLogin.Usuario, 
        Dependentes.Nome [Nome do dependente] 
    FROM Dependentes
	    INNER JOIN ClientesComLogin ON 
	        ClientesComLogin.idCliente = Dependentes.idCliente
	
-- -----------------------------------------------------
-- Funcionários e Cargos
-- -----------------------------------------------------
SELECT  Funcionarios.Nome, 
        Funcionarios.CPF, 
        Cargos.NomeCargo, 
        Cargos.Salario 
    FROM Funcionarios
	    INNER JOIN Cargos ON
	        Cargos.idCargo = Funcionarios.idCargo
	ORDER BY Cargos.NomeCargo, Funcionarios.Nome
GO

-- -----------------------------------------------------
-- Funcionários, cargos e suas admissões
-- -----------------------------------------------------
SELECT  Funcionarios.Nome, 
        Admissoes.DataAdmissao, 
        Cargos.NomeCargo, 
        Cargos.Salario 
    FROM Funcionarios_Admissoes
	    INNER JOIN Funcionarios ON 
	        Funcionarios.CPF = Funcionarios_Admissoes.CPF 
	    INNER JOIN Admissoes 
	        ON Admissoes.idAdmissao = Funcionarios_Admissoes.idAdmissão 
	    INNER JOIN Cargos 
	        ON Cargos.idCargo = Funcionarios.idCargo
GO

