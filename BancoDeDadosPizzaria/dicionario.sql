use Pizzaria
go

IF EXISTS (select name from sys.procedures where name = 'addDescricaoCampo')
        DROP PROCEDURE addDescricaoCampo
GO
CREATE PROCEDURE addDescricaoCampo(
	@Tabela as varchar(100) ,
	@Coluna as varchar(100) , 
	@Descricao as Varchar(1000))
AS 
BEGIN
	IF NOT EXISTS(SELECT * FROM FN_LISTEXTENDEDPROPERTY ('caption', 'SCHEMA', 'dbo', 'TABLE',@Tabela, 'Column', NULL)X WHERE name = 'Caption' AND objname = @Coluna) 
	 BEGIN    
		EXEC sys.sp_addextendedproperty
		@name=  'Caption',
		@value= @Descricao ,
		@level0type='SCHEMA',
		@level0name='dbo',
		@level1type='TABLE',
		@level1name= @Tabela,
		@level2type='COLUMN',
		@level2name= @coluna
	END
	ELSE
	BEGIN
		EXEC sys.SP_UPDATEEXTENDEDPROPERTY 
		@name=  'Caption',
		@value= @Descricao ,
		@level0type='SCHEMA',
		@level0name='dbo',
		@level1type='TABLE',
		@level1name= @Tabela,
		@level2type='COLUMN',
		@level2name= @coluna
	END
END
GO

EXEC addDescricaoCampo 'Clientes', 'idCliente','PK dos clientes'
EXEC addDescricaoCampo 'Clientes', 'Nome','Nome dos clientes'
EXEC addDescricaoCampo 'Clientes', 'Endereco','Armazena o endereco dos clientes'
EXEC addDescricaoCampo 'Clientes', 'idLogin','FK login'
EXEC addDescricaoCampo 'Clientes', 'Telefone','Telefone dos clientes'
GO

EXEC addDescricaoCampo 'Dependentes', 'idDependentes','PK dos dependentes'
EXEC addDescricaoCampo 'Dependentes', 'Nome','Nome do dependente'
EXEC addDescricaoCampo 'Dependentes', 'idCliente','FK do cliente que esta dependendo'
GO

EXEC addDescricaoCampo 'Logins', 'idLogin','PK dos usuarios do site'
EXEC addDescricaoCampo 'Logins', 'Usuario','Usuario para efetuar login'
EXEC addDescricaoCampo 'Logins', 'Senha','Senha para acessar o site'
GO

EXEC addDescricaoCampo 'Pedidos', 'idPedido','PK dos pedidos'
EXEC addDescricaoCampo 'Pedidos', 'data','Data que o pedido foi realizado'
EXEC addDescricaoCampo 'Pedidos', 'idCliente','FK do cliente que efetuou o pedido'
EXEC addDescricaoCampo 'Pedidos', 'CPF','FK do funcionario que atendeu o pedido'
EXEC addDescricaoCampo 'Pedidos', 'Endereco','Endereco do local para entrega do pedido'
GO

EXEC addDescricaoCampo 'Produtos_Pedidos', 'idPedido','FK dos pedidos'
EXEC addDescricaoCampo 'Produtos_Pedidos', 'idProduto','FK dos produtos'
GO

EXEC addDescricaoCampo 'Produtos', 'idProduto','PK dos produtos vendidos na pizzaria'
EXEC addDescricaoCampo 'Produtos', 'Nome','Nome do produto'
GO

EXEC addDescricaoCampo 'Ingredientes', 'idProduto','FK do Produto'
EXEC addDescricaoCampo 'Ingredientes', 'idEstoque','FK do Estoque'
EXEC addDescricaoCampo 'Ingredientes', 'Qtd','Quantidade do ingrediente utilizado para fazer a pizza'
GO

EXEC addDescricaoCampo 'Estoques', 'idEstoque','PK do item do estoque'
EXEC addDescricaoCampo 'Estoques', 'Produto','Nome do produto'
EXEC addDescricaoCampo 'Estoques', 'Quantidade','Quantidade do item em estoque'
GO

EXEC addDescricaoCampo 'Fornecedores', 'idFornecedor','PK do Forcedor'
EXEC addDescricaoCampo 'Fornecedores', 'Nome','Nome do Fornecedor'
EXEC addDescricaoCampo 'Fornecedores', 'CNPJ','Numero do cadastro de pessoa juridica'
EXEC addDescricaoCampo 'Fornecedores', 'Endereco','Endereco do fornecedor'
EXEC addDescricaoCampo 'Fornecedores', 'Telefone','Telefone do fornecedor'
GO

EXEC addDescricaoCampo 'Estoques_Fornecedores', 'idEstoque','FK do item do estoque'
EXEC addDescricaoCampo 'Estoques_Fornecedores', 'idFornecedor','FK do fornecedor'

EXEC addDescricaoCampo 'Funcionarios', 'CPF','PK - CPF do funcionario'
EXEC addDescricaoCampo 'Funcionarios', 'idCargo','FK referencia o cargo do funcionario'
EXEC addDescricaoCampo 'Funcionarios', 'Nome','Nome do Funcionario'
EXEC addDescricaoCampo 'Funcionarios', 'Endereco','Endereco do Funcionario'
EXEC addDescricaoCampo 'Funcionarios', 'Telefone','Telefone do Funcionario'
EXEC addDescricaoCampo 'Funcionarios', 'RG','RG do Funcionario'
EXEC addDescricaoCampo 'Funcionarios', 'NumCarteira','Numero da carteira de trabalho'
EXEC addDescricaoCampo 'Funcionarios', 'DataNascimento','Data do nascimento do Funcionario'
GO

EXEC addDescricaoCampo 'Admissoes', 'idAdmissao','PK do registro da tabela admissoes'
EXEC addDescricaoCampo 'Admissoes', 'DataAdmissao','Data em que o funcionario foi admitido'
EXEC addDescricaoCampo 'Admissoes', 'DataDemissao','Data em que o funcionario foi demitido'
GO

EXEC addDescricaoCampo 'Funcionarios_Admissoes', 'CPF','FK - referencia o funcionario'
EXEC addDescricaoCampo 'Funcionarios_Admissoes', 'idAdmissão','FK - referencia a admissao'
GO

EXEC addDescricaoCampo 'Logs', 'idLog','PK da tabela Logs'
EXEC addDescricaoCampo 'Logs', 'DescAtividade','Armazena a atividade(comandos) do usuario do sistema'
EXEC addDescricaoCampo 'Logs', 'DataHora','Armazena a Data da atividade e o horario'
EXEC addDescricaoCampo 'Logs', 'CPF','FK do funcionario'
GO

EXEC addDescricaoCampo 'Cargos', 'idCargo','PK do cargo'
EXEC addDescricaoCampo 'Cargos', 'Salario','Salario correspondente ao cargo'
EXEC addDescricaoCampo 'Cargos', 'NomeCargo','Nome do cargo'
GO

IF EXISTS (select name from sys.procedures where name = 'usp_GenerateDBDictionary')
        DROP PROCEDURE usp_GenerateDBDictionary
GO
CREATE PROCEDURE usp_GenerateDBDictionary
AS
BEGIN
	SELECT a.name AS 'TABELA' ,b.name AS 'ATRIBUTO' ,c.name AS 'TIPO',CASE WHEN b.isnullable = 1  THEN 'Sim' ELSE 'Nao' END 'PERMITE NULO',CASE WHEN 
	d.name is null THEN 'Nao' ELSE 'Sim' END AS 'PK',
	CASE WHEN e.parent_object_id is null THEN 'Nao' ELSE 'Sim' END AS 'FK',CASE WHEN e.parent_object_id 
	is null THEN '-' ELSE g.name  END AS 'Ref. Tabela',
	CASE WHEN h.value is null THEN '-' ELSE h.value END [Description]
	from sysobjects as a
	join syscolumns as b on a.id = b.id
	join systypes as c on b.xtype = c.xtype 
	left join (SELECT  so.id,sc.colid,sc.name 
		  FROM syscolumns sc
		  JOIN sysobjects so ON so.id = sc.id
		  JOIN sysindexkeys si ON so.id = si.id 
						and sc.colid = si.colid
		  WHERE si.indid = 1) d on a.id = d.id and b.colid = d.colid
	left join sys.foreign_key_columns as e on a.id = e.parent_object_id and b.colid = e.parent_column_id    
	left join sys.objects as g on e.referenced_object_id = g.object_id  
	left join sys.extended_properties as h on a.id = h.major_id and b.colid = h.minor_id
	where a.type = 'U' order by a.name
END
GO

exec usp_GenerateDBDictionary
go
