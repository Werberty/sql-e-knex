-- Update - Atualiza registros
update users set 
first_name = 'Luiz',
last_name = 'Miranda'
where id between 13 and 17;

select * from users where id between 13 and 17;