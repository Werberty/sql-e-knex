-- where filtra registros
-- Operadores de comparação: = < <= > >= <> !=
-- Operadores logicos: and or
select * from users
where
created_at < '2022-06-08 05:43:23'
or first_name = 'werberty';