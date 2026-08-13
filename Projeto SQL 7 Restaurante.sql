/* Atividade SQL 7 Restaurante */

use restaurante_beira_mar; -- (1)

select * from clientes;
select * from funcionarios;
select * from info_produtos;
select * from pedidos;
select * from produtos;

-- Criar uma view (2)
CREATE VIEW resumo_pedido AS
SELECT 
    p.id_pedido AS id,
    p.quantidade,
    p.data_pedido AS data,
    c.nome AS nome_cliente,
    c.email AS email_cliente,
    f.nome AS nome_funcionario,
    pr.nome AS nome_produto,
    pr.preco AS preco_produto
FROM pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente
INNER JOIN funcionarios f ON p.id_funcionario = f.id_funcionario
INNER JOIN produtos pr ON p.id_produto = pr.id_produto;

SELECT * FROM resumo_pedido;

-- Selecionar View (3)
SELECT 
    id,
    nome_cliente,
    (quantidade * preco_produto) AS total
FROM resumo_pedido;

-- Atualizar uma view (4)
CREATE OR REPLACE VIEW resumo_pedido AS
SELECT 
    p.id_pedido AS id,
    p.quantidade,
    p.data_pedido AS data,
    c.nome AS nome_cliente,
    c.email AS email_cliente,
    f.nome AS nome_funcionario,
    pr.nome AS nome_produto,
    pr.preco AS preco_produto,
    (p.quantidade * pr.preco) AS total
FROM pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente
INNER JOIN funcionarios f ON p.id_funcionario = f.id_funcionario
INNER JOIN produtos pr ON p.id_produto = pr.id_produto;

SELECT id, nome_cliente, total 
FROM resumo_pedido;

-- Repetir consulta 3 (5)
SELECT 
    id,
    nome_cliente,
    total
FROM resumo_pedido;

-- Repetir consulta 4 com o explain (5)
EXPLAIN SELECT 
    id,
    nome_cliente,
    total
FROM resumo_pedido;

-- Criar Função (6)
DELIMITER //

CREATE FUNCTION BuscaIngredientesProduto(p_id_produto INT)
RETURNS VARCHAR(200)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_ingredientes VARCHAR(200);

    SELECT ingredientes 
    INTO v_ingredientes
    FROM info_produtos
    WHERE id_produto = p_id_produto
    LIMIT 1;

    RETURN v_ingredientes;
END //

DELIMITER ;

SELECT 
    nome, 
    preco, 
    BuscaIngredientesProduto(id_produto) AS ingredientes
FROM produtos;

-- Buscar Id produto 10 (7)
SELECT BuscaIngredientesProduto(10) AS ingredientes;

-- Função media pedido (8)
DELIMITER //
CREATE FUNCTION MediaPedido(p_id_pedido INT)
RETURNS VARCHAR(100)
READS SQL DATA 
BEGIN
	DECLARE v_media_geral DECIMAL(10, 2);
    DECLARE v_total_pedido DECIMAL(10, 2);
    DECLARE v_resultado VARCHAR(100);
    
    SELECT AVG(quantidade * preco)
    INTO v_media_geral
    FROM pedidos;
    
    SELECT(quantidade * preco)
    INTO v_total_pedido
    FROM pedidos
    WHERE id_pedido = p_id_pedido;
    
    IF v_total_pedido IS NULL THEN
        RETURN 'Pedido não encontrado.';
    END IF;

    IF v_total_pedido > v_media_geral THEN
        SET v_resultado = 'O total do pedido está ACIMA da média de todos os pedidos.';
    ELSEIF v_total_pedido < v_media_geral THEN
        SET v_resultado = 'O total do pedido está ABAIXO da média de todos os pedidos.';
    ELSE
        SET v_resultado = 'O total do pedido é IGUAL à média de todos os pedidos.';
    END IF;

    RETURN v_resultado;
END //
DELIMITER ;

-- (9)

SELECT mediaPedido(5) AS resultado_pedido;

SELECT mediaPedido(6) AS resultado_pedido;
