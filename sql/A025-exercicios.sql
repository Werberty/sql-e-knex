-- 1) Insira 5 usuários
INSERT into users (
	first_name,
	last_name,
	email,
	password_hash,
	salary)
values (
	'Bizerra',
	'Mendonsa',
	'bez.men@mail.com',
	'AS097Sjdoan123',
	'23412.67'
	),
(
	'Zeca',
	'Piranha',
	'zec.pira@email.com',
	'asdnJAsnd(97',
	'7500'
	),
(
	'Biazinha',
	'Princi',
	'bia.pri@email.com',
	'asdnAUSDBHjadnd',
	'857.32'
	),
(
	'Ana',
	'Mirian',
	'ana.mir@email.com',
	'Mansik123asd',
	'43901.37'
	),
(
	'Mulaino',
	'Intyna',
	'mua.int@email.com',
	'MAsnd@#Nadsa',
	'7854.99');

-- 2) Insira 5 perfís para os usuários inseridos
INSERT into profiles
(bio, description, user_id)
SELECT
CONCAT('Bio de ', first_name),
CONCAT('Description de ', first_name),
id
from users
WHERE id BETWEEN 111 and 115;

-- 3) Insira permissões (roles) para os usuários inseridos
INSERT INTO users_roles (user_id, role_id)
SELECT 
id,
(SELECT id from roles order by rand() LIMIT 1) as qualquer
from users
WHERE id BETWEEN 111 AND 115;

-- 4) Selecione os últimos 5 usuários por ordem decrescente
SELECT id, first_name 
from users
ORDER by id DESC
LIMIT 5;

-- 5) Atualize o último usuário inserido
UPDATE users
set email = 'email.novo@hotm.com'
WHERE id = 115;

-- 6) Remova uma permissão de algum usuário
DELETE r from users u
left join roles r
on r.name = 'GET'
WHERE first_name = 'Werberty';

-- 7) Remova um usuário que tem a permissão "PUT"
DELETE u from users u
join roles r
WHERE r.name = 'PUT' AND u.id = 36;

-- 8) Selecione usuários com perfís e permissões (obrigatório)
SELECT u.id as uid, p.id as pid,
p.bio, u.first_name, ur.role_id 
FROM users as u
INNER JOIN profiles as p
ON u.id = p.user_id
INNER JOIN  users_roles as ur
ON u.id = ur.user_id;

-- 9) Selecione usuários com perfís e permissões (opcional)
SELECT u.id as uid, p.id as pid,
p.bio, u.first_name, ur.role_id 
FROM users as u
LEFT JOIN profiles as p
ON u.id = p.user_id
INNER JOIN  users_roles as ur
ON u.id = ur.user_id;

-- 10) Selecione usuários com perfís e permissões ordenando por salário
SELECT u.id as uid, p.id as pid,
p.bio, u.first_name,u.salary, ur.role_id 
FROM users as u
INNER JOIN profiles as p
ON u.id = p.user_id
INNER JOIN  users_roles as ur
ON u.id = ur.user_id
ORDER BY salary DESC;