USE master
GO

IF EXISTS (select name from sys.databases where name = 'Pizzaria')
	DROP DATABASE Pizzaria
go

CREATE DATABASE Pizzaria
go

USE Pizzaria
go

-- -----------------------------------------------------
-- Table Pizzaria.Login
-- -----------------------------------------------------
CREATE TABLE Login (
  idLogin INT NOT NULL,
  Usuario VARCHAR(45) NULL,
  Senha VARCHAR(20) NULL,
  PRIMARY KEY (idLogin)
)
GO

-- -----------------------------------------------------
-- Table Pizzaria.Clientes
-- -----------------------------------------------------
CREATE TABLE Clientes (
  idClientes INT NOT NULL PRIMARY KEY,
  Endereco VARCHAR(200) NULL,
  Login_idLogin INT NOT NULL,
  Telefone VARCHAR(18) NULL,
  CONSTRAINT fk_Clientes_Login1
    FOREIGN KEY (Login_idLogin)
    REFERENCES Login (idLogin)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
GO

-- -----------------------------------------------------
-- Table Pizzaria.Cargo
-- -----------------------------------------------------
CREATE TABLE Cargo (
  idCargo INT NOT NULL,
  Salario DECIMAL(6,2) NULL,
  NomeCargo VARCHAR(25) NULL,
  PRIMARY KEY (idCargo)
)
GO

-- -----------------------------------------------------
-- Table Pizzaria.Funcionarios
-- -----------------------------------------------------
CREATE TABLE Funcionarios (
  Nome VARCHAR(45) NULL,
  Endereco VARCHAR(200) NULL,
  Telefone VARCHAR(18) NULL,
  CPF VARCHAR(11) NOT NULL,
  RG VARCHAR(10) NULL,
  NumCarteira VARCHAR(45) NULL,
  DataNascimento DATE NULL,
  Cargo_idCargo INT NOT NULL,
  PRIMARY KEY (CPF),
  CONSTRAINT fk_Funcionarios_Cargo1
    FOREIGN KEY (Cargo_idCargo)
    REFERENCES Cargo (idCargo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
GO

-- -----------------------------------------------------
-- Table Pizzaria.Pedidos
-- -----------------------------------------------------
CREATE TABLE Pedidos (
  idPedidos INT NOT NULL,
  data DATETIME NULL,
  Clientes_idClientes INT NOT NULL,
  Funcionarios_CPF VARCHAR(11) NOT NULL,
  Endereco VARCHAR(200) NULL,
  PRIMARY KEY (idPedidos),
  CONSTRAINT fk_Pedidos_Clientes
    FOREIGN KEY (Clientes_idClientes)
    REFERENCES Clientes (idClientes)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Pedidos_Funcionarios1
    FOREIGN KEY (Funcionarios_CPF)
    REFERENCES Funcionarios (CPF)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
GO

-- -----------------------------------------------------
-- Table Pizzaria.Dependentes
-- -----------------------------------------------------
CREATE TABLE Dependentes (
  idDependentes INT NOT NULL,
  Nome VARCHAR(45) NULL,
  Clientes_idClientes INT NOT NULL,
  PRIMARY KEY (idDependentes),
  CONSTRAINT fk_Dependentes_Clientes1
    FOREIGN KEY (Clientes_idClientes)
    REFERENCES Clientes (idClientes)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
GO

-- -----------------------------------------------------
-- Table Pizzaria.Produtos
-- -----------------------------------------------------
CREATE TABLE Produtos (
  idProduto INT NOT NULL,
  Nome VARCHAR(45) NULL,
  PRIMARY KEY (idProdutos)
)
GO

-- -----------------------------------------------------
-- Table Pizzaria.Estoque
-- -----------------------------------------------------
CREATE TABLE Estoque (
  idEstoque INT NOT NULL,
  Produto VARCHAR(45) NULL,
  Quantidade INT NULL,
  PRIMARY KEY (idEstoque)
)
GO


-- -----------------------------------------------------
-- Table Pizzaria.Ingredientes
-- -----------------------------------------------------
CREATE TABLE Ingredientes (
	idIngrediente INT NOT NULL,
	idProduto INT NOT NULL,
	idEstoque INT NOT NULL,
	PRIMARY KEY (idProduto, idEstoque),
	Qtd TINYINT NOT NULL,
	FOREIGN KEY (idProduto)
		REFERENCES Produtos (idProduto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
    FOREIGN KEY (idEstoque)
		REFERENCES Estoque (idEstoque) 
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
GO

-- -----------------------------------------------------
-- Table Pizzaria.Fornecedor
-- -----------------------------------------------------
CREATE TABLE Fornecedor (
  idFornecedor INT NOT NULL,
  Nome VARCHAR(45) NULL,
  CNPJ VARCHAR(25) NULL,
  Endereco VARCHAR(45) NULL,
  Telefone VARCHAR(18) NULL,
  PRIMARY KEY (idFornecedor)
)
GO



-- -----------------------------------------------------
-- Table Pizzaria.Estoque_Fornecedor
-- -----------------------------------------------------
CREATE TABLE Estoque_Fornecedor (
  Estoque_idEstoque INT NOT NULL,
  Fornecedor_idFornecedor INT NOT NULL,
  CONSTRAINT fk_Estoque_has_Fornecedor_Estoque1
    FOREIGN KEY (Estoque_idEstoque)
    REFERENCES Estoque (idEstoque)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Estoque_has_Fornecedor_Fornecedor1
    FOREIGN KEY (Fornecedor_idFornecedor)
    REFERENCES Fornecedor (idFornecedor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
GO

-- -----------------------------------------------------
-- Table Pizzaria.Produtos_Pedidos
-- -----------------------------------------------------
CREATE TABLE Produtos_Pedidos (
  Produtos_idProdutos INT NOT NULL,
  Pedidos_idPedidos INT NOT NULL,
  CONSTRAINT fk_Produtos_has_Pedidos_Produtos1
    FOREIGN KEY (Produtos_idProdutos)
    REFERENCES Produtos (idProdutos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Produtos_has_Pedidos_Pedidos1
    FOREIGN KEY (Pedidos_idPedidos)
    REFERENCES Pedidos (idPedidos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
GO

-- -----------------------------------------------------
-- Table Pizzaria.Admissao
-- -----------------------------------------------------
CREATE TABLE Admissao (
  idAdmissao INT NOT NULL,
  DataAdmissao DATE NULL,
  DataDemissao DATE NULL,
  PRIMARY KEY (idAdmissao)
)
GO

-- -----------------------------------------------------
-- Table Pizzaria.Funcionarios_Admissao
-- -----------------------------------------------------
CREATE TABLE Funcionarios_Admissao (
  Funcionarios_CPF VARCHAR(11) NOT NULL,
  Admissão_idAdmissão INT NOT NULL,
  CONSTRAINT fk_Funcionarios_has_Admissão_Funcionarios1
    FOREIGN KEY (Funcionarios_CPF)
    REFERENCES Funcionarios (CPF)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Funcionarios_has_Admissão_Admissão1
    FOREIGN KEY (Admissão_idAdmissão)
    REFERENCES Admissao (idAdmissao)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
GO

-- -----------------------------------------------------
-- Table Pizzaria.Log
-- -----------------------------------------------------
CREATE TABLE Log (
  idLog INT NOT NULL,
  DescAtividade VARCHAR(200) NULL,
  DataHora DATETIME NULL,
  Funcionarios_CPF VARCHAR(11) NOT NULL,
  PRIMARY KEY (idLog),
  CONSTRAINT fk_Log_Funcionarios1
    FOREIGN KEY (Funcionarios_CPF)
    REFERENCES Funcionarios (CPF)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
GO

