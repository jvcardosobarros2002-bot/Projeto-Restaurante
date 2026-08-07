/* Atividade SQL 5 Restaurante */

use restaurante_beira_mar; -- (1)

select * from clientes;
select * from funcionarios;
select * from info_produtos;
select * from pedidos;
select * from produtos;

-- Quantidade de pedidos (2)

select count(*) as total_pedidos 
from pedidos;

-- Clientes Unicos (3)

select count(distinct id_cliente) as total_clientes_unicos
from pedidos;

-- Média de Preço (4)

select round(avg(preco), 2) as preco_medio_geral
from produtos;

-- Máximo e Mínimo Produtos (5)

select 
	max(preco) as maior_preco,
	min(preco) as menor_preco
    from produtos;
    
-- Rank 5 produtos mais caros (6)

select 
	rank() over (order by preco desc) as ranking,
    nome, categoria, preco
from produtos limit 5;

-- Média dos produtos (7)

select 
	categoria, 
    round(avg(preco),2) as média_preco 
from produtos 
group by categoria;

-- Fornecedor e quantidade de produtos (8)

select 
    fornecedor,
    count(*) as quantidade_produtos
from info_produtos
group by fornecedor;

-- Fornecedor com mais de um produto (9)

select 
    fornecedor,
    count(*) as quantidade_produtos
from info_produtos
group by fornecedor 
having count(*) > 1;

-- Cliente com 1 pedido (10)

select distinct 
	id_cliente, 
    count(id_cliente) as pedidos 
    from pedidos 
    where quantidade 
group by id_pedido 
having count(*) = 1;