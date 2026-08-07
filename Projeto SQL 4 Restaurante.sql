/* Atividade SQL Restaurante 4 */

use restaurante_beira_mar; -- (1)

select * from pedidos;

-- ID FUNCIONARIO 4 status 'pendente' (2)

select * 
from pedidos 
where id_funcionario = 4 
  and status = 'Pendente';
  
-- Todos os pedidos Pendentes (3)

select * 
from pedidos
	where status <> 'Concluído' or status is null;
    
-- Id Produtos (4)

select *
from pedidos
	where id_produto in(1, 3, 5, 7, 8);

-- Clientes que começam com cache index (5)

select * 
from clientes 
	where nome like 'c%';
    
-- Ingredientes que contém carne e frango (6)

select *
from produtos
	where nome like '%Carne%'
    or nome like '%Frango%';
    
-- Produtos com preços de 20 a 30 (7)

select *
from produtos
	where preco between 20 and 30;
    
-- Atualizar pedido 6 para status null (8)

update pedidos
set status = null
where id_pedido = 6;

-- Selecionar Pedidos Nulos (9)

select * 
from pedidos 
where status is null;

-- Mostrar status cancelado (10)

select
    id_pedido, 
    coalesce(status, 'Cancelado') as status 
from pedidos;

-- Salário Funcionario

SELECT 
    nome, 
    cargo, 
    salario,
    CASE 
        WHEN salario > 3000 THEN 'Acima da média'
        ELSE 'Abaixo da média'
    END AS media_salario
FROM funcionarios;