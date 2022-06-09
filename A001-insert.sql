use base_de_dados;
-- Mostra as tabelas da base de dados
show tables;
-- Descreve as tabelas
describe users;
-- inserir registrod dentro da base de dados
INSERT into users 
	(first_name, last_name, email, password_hash) values
	("Gustavo", "A", "gustavo@email.com", "3_hash"),
	("José", "B", "jose@email.com", "4_hash"),
	("Ana", "C", "ana@email.com", "5_hash");