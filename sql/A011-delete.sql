-- Delete apaga registros da tabela
DELETE FROM users where id BETWEEN 100 and 105;

-- Aviso: use SELECT para garantir que está
-- apagando os valores corretos
select * from users where id BETWEEN 100 and 105;