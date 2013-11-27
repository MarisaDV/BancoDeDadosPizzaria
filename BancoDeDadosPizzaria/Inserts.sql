USE `Pizzaria` ;

INSERT INTO Login VALUES 
	(1, 'Guilherme', 'egmdc321'),
	(2, 'Matheus', 'egmdc321'),
	(3, 'Victor', 'egmdc321');
	
INSERT INTO Clientes VALUES 
	(1, 'Av Ministro Nelson Hungria, 280, Centro, Santo Antônio do Pinhal-SP - CEP 12450-000', 1, '(12)3674-3689'), 
	(2, 'Av Coronel Sebastião Marcondes da Silva, 149, Centro, Santo Antônio do Pinhal-SP - CEP 12450-000', 1, '(12)3654-5709'), 
	(3, 'Av do Povo, 280, Centro, Taubaté-SP - CEP 12440-123', 1, '(12)3644-5610');

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
	
