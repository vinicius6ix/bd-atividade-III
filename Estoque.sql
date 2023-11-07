CREATE DATABASE Estoque;
USE Estoque;

CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    quantidade_em_estoque INT
);

INSERT INTO produtos (id, nome, quantidade_em_estoque) VALUES
(1, 'Produto A', 100),
(2, 'Produto B', 50),
(3, 'Produto C', 75);

DELIMITER //
CREATE TRIGGER atualizar_estoque_venda
AFTER INSERT ON vendas
FOR EACH ROW
BEGIN
    DECLARE produto_id INT;
    DECLARE quantidade_vendida INT;

    SET produto_id = NEW.produto_id; 
    SET quantidade_vendida = NEW.quantidade; 

    UPDATE produtos
    SET quantidade_em_estoque = quantidade_em_estoque - quantidade_vendida
    WHERE id = produto_id;
END;
//
DELIMITER ;

CREATE TABLE vendas (
    id INT PRIMARY KEY,
    produto_id INT,
    quantidade INT,
    data_venda DATE
);

ALTER TABLE vendas
ADD FOREIGN KEY (produto_id) REFERENCES produtos(id);

INSERT INTO vendas (id, produto_id, quantidade, data_venda) VALUES
(1, 1, 5, '2023-01-15'),
(2, 2, 10, '2023-02-20');
