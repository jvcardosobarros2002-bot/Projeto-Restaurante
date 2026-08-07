/* Atividade Restaurante 3 */

use restaurante_beira_mar;

-- Preços superiores a 30.00 RS
select nome, categoria, preco 
from produtos 
where preco > 30;

-- Data inferior a 1985
select nome, telefone, data_nascimento 
from clientes 
where data_nascimento < '1985-01-01';

-- Todos os produdos que contém carne no nome
select id_produto, ingredientes 
from info_produtos  
where ingredientes like '%carne%'; -- (%) caractere curinga 
-- Usado com o comando LIKE para buscar textos por aproximação (representa qualquer quantidade de caracteres)

-- Produtos em ordem crescente com base na categoria
select nome, categoria 
from produtos 
order by categoria asc, nome asc;

-- 5 Protudos mais caros do restaurante
select * from produtos 
order by preco 
desc limit 5;

-- 2 pratos principais em promoção essa semana
select * from produtos 
where categoria = 'Prato Principal'limit 2 offset 6;

-- Tabela de backup
create table backup_pedidos select * from pedidos;
select * from Backup_pedidos;
