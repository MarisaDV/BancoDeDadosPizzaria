USE `Pizzaria`;

INSERT INTO Login VALUES 
	(1, 'Guilherme', 'egmdc321'),
	(2, 'Matheus', 'egmdc321'),
	(3, 'Victor', 'egmdc321'),
	(4, 'Marcelo', 'egmdc321'),
	(4, 'Pedro', 'egmdc321'),
	(4, 'Joao', 'egmdc321');
	
INSERT INTO Clientes VALUES 
	(1, 'Av Ministro Nelson Hungria, 280, Centro, Santo Antônio do Pinhal-SP - CEP 12450-000', 1, '(12)3674-3689'), 
	(2, 'Av Coronel Sebastião Marcondes da Silva, 149, Centro, Santo Antônio do Pinhal-SP - CEP 12450-000', 1, '(12)3654-5709'), 
	(3, 'Rua Sao João, 455, Centro, São José de Campos-SP - CEP 12440-123', 1, '(12)3644-5610'),
	(4, 'Rua Quinze De Novembro, 394, Centro, Taubaté-SP - CEP 12440-123', 1, '(12)3644-5160'),
	(5, 'Rua Sao Sebastiao, 289, Centro, Tremembé-SP - CEP 12440-123', 0, '(12)3644-6510'),
	(6, 'Rua Santos Dumont, 876, Centro, Ubatuba-SP - CEP 12440-123', 1, '(12)3644-1560'),
	(7, 'Rua Belo Horizonte, 255, Centro, Londrina-PR - CEP 12440-123', 1, '(32)3644-5560'),
	(8, 'Rua José Bonifácio, 580, Centro, Maringá-PR - CEP 12440-123', 0, '(32)3644-5660'),
	(9, 'Rua Vinte e Três, 290, Centro, Barbosa-SP - CEP 12440-123', 1, '(12)3644-5980'),
	(10, 'Rua Santa Rita, 276, Centro, Manaus-AM - CEP 12440-123', 0, '(98)3644-5130');

INSERT INTO Cargo VALUES 
	(1, 1500, 'Entregador'),
	(2, 1000, 'Balconista'),
	(3, 2500, 'Gerente'),
	(4, 2000, 'Pizzaiolo'),
	(5, 1500, 'Garçon');

INSERT INTO Funcionarios VALUES 
	('Roberto Jefferson', 'Rua Conde de Bobadela, 225, Centro, Rio Branco', '9-9909-4413', '12332112364'),
	('Amanda Silveira', 'Rua Senador Rocha Lagoa, 235, Centro, Cuiabá', '9-9909-4413', '12332112365'),
	('Carlos Eduardo', 'Praça Reinaldo Alves de Brito, 325, Centro, Curitiba', '9-9909-4413', '12332112366'),
	('Miguel de Arrais', 'Rua Conde de Bobadela, 223, Centro, João Pessoa', '9-9909-4413', '12332112367'),
	('Carlos Belozo', 'Praça Silviano Brandão, 245, Centro, Belém', '9-9909-4413', '12332112368'),
	('Sandra de Sá', 'Rua Conde de Bobadela, 224, Centro, Teresina', '9-9909-4413', '12332112369'),
	('Sérgio Malandro', 'Rua Alvarenga, 425, Centro, Natal', '9-9909-4413', '12332112363'),
	('Miguel de Souza', 'Rua Randolfo Bretas, 525, Centro, Porto Alegre', '9-9909-4413', '12332112362'),
	('Catarina Santos', 'Rua Antônio de Albuquerque, 255, Centro, Florianópolis', '9-9909-4413', '12332112361'),
	('José Benedito', 'Praça Barão do Rio Branco, 909, Centro, Aracajú', '9-9909-4413', '12332112360');
	
INSERT INTO Estoque VALUES
	(1,"Extrato de Tomate",12),
	(2,"Requeijão Cremoso",10),
	(3,"Farinha de Trigo",20),
	(4,"Queijo Mussarela",10),
	(5,"Frango desfiado",14),
	(6,"Oregano",4),
	(7,"Calabresa",7),
	(8,"Bacon",18),
	(9,"Ovo",29),
	(10,"Cebola",13),
	(11,"Queijo parmesão",13),
	(12,"Manjericão",7),
	(13,"Abobrinha",3),
	(14,"Beringela",9),
	(15,"Bróculis",10),
	(16,"Palmito",21),
	(17,"Champignon",12),
	(18,"Lombo",11),
	(19,"Tomate",2),
	(20,"Carne Seca",2);

INSERT INTO Produtos VALUES
	(1,"Calabresa"),
	(2,"Frango C/ Catupiry"),
	(3,"Lombo"),
	(4,"Margarita"),
	(5,"Portuguesa"),
	(6,"Napolitana"),
	(7,"Frango Especial"),
	(8,"Toscana"),
	(9,"Nordestina"),
	(10,"Vegetariana")

INSERT INTO Ingredientes VALUES
	(1,1,1),
	(1,4,1),
	(1,7,1),
	(1,10,1),
	
	(2,1,1),
	(2,5,1),
	(2,2,1),
	
	(3,1,1),
	(3,4,1),
	(3,1,18),

	(4,1,1),
	(4,4,1),
	(4,19,1),
	(4,11,1),
	(4,12,1),

	(5,1,1),
	(5,9,1),
	(5,4,1),
	(5,10,1),

	(6,1,1),
	(6,4,1),
	(6,11,1),
	(6,19,1),

	(7,1,1),
	(7,5,1),
	(7,2,1),
	(7,8,1),	
	(7,6,1),

	(8,1,1),
	(8,4,1),
	(8,7,1),
	(8,6,1),

	(9,1,1),
	(9,2,1),
	(9,20,1),
	(9,10,1),

	(10,1,1),
	(10,13,1),
	(10,14,1),
	(10,15,1),
	(10,16,1),
	(10,17,1);

INSERT INTO Fornecedor VALUES
	(1,'Alimentos Já', '01010101-01010','Rua Carlos Bom Tempo, 2215, Centro, Rio Branco', '9-9909-4413'),
	(2,'Boa Massa', '02020202-02020','Rua Conde de Monte Cristo, 21, São Paulo', '9-9909-4413'),

INSERT INTO Estoque_Fornecedor VALUES
	(1,2),
	(2,1),
	(3,1),
	(4,2),
	(5,2),
	(6,2),
	(7,1),
	(8,1),
	(9,1),
	(10,2),
	(11,2),
	(12,2),
	(13,1),
	(14,1),
	(15,2),
	(16,2),
	(17,1),
	(18,1),
	(19,2),
	(20,1);