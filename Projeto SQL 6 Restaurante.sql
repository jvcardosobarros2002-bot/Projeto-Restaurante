/* Atividade SQL 6 Restaurante */

use restaurante_beira_mar; 

select * from clientes;
select * from funcionarios;
select * from info_produtos;
select * from pedidos;
select * from produtos;

-- (1)
select 
    p.id_produto,
    p.nome,
    p.descricao,
    ip.ingredientes
from produtos p
inner join info_produtos ip on p.id_produto = ip.id_produto;

-- (2)
SELECT 
    p.id_pedido,
    p.quantidade,
    p.data_pedido,
    c.nome,
    c.email
FROM pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente;

-- (3)
SELECT 
    p.id_pedido,
    p.quantidade,
    p.data_pedido,
    c.nome AS nome_cliente,
    c.email AS email_cliente,
    f.nome AS nome_funcionario
FROM pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente
INNER JOIN funcionarios f ON p.id_funcionario = f.id_funcionario;

-- (4)
SELECT 
    p.id_pedido,
    p.quantidade,
    p.data_pedido,
    c.nome AS nome_cliente,
    c.email AS email_cliente,
    f.nome AS nome_funcionario,
    pr.nome AS nome_produto,
    pr.preco
FROM pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente
INNER JOIN funcionarios f ON p.id_funcionario = f.id_funcionario
INNER JOIN produtos pr ON p.id_produto = pr.id_produto;

-- (5)
SELECT 
    c.nome AS nome_cliente,
    p.id_pedido,
    p.status
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE p.status = 'Pendente'
ORDER BY p.id_pedido DESC;

-- (6)
SELECT 
    c.id_cliente,
    c.nome,
    c.email
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;

-- (7)
SELECT 
    c.nome AS nome_cliente,
    COUNT(p.id_pedido) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome;

-- (8)
SELECT 
    p.id_pedido,
    pr.nome AS nome_produto,
    p.quantidade,
    p.preco AS preco_unitario,
    (p.quantidade * p.preco) AS preco_total
FROM pedidos p
INNER JOIN produtos pr ON p.id_produto = pr.id_produto;