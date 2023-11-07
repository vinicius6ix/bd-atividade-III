CREATE DATABASE senaidobom;
USE senaidobom;

CREATE TABLE produtos (
  id INT PRIMARY KEY,
  nome VARCHAR(255),
  quantidade_em_estoque INT
);

INSERT INTO produtos (id, nome, quantidade_em_estoque) VALUES 
(1, 'Produto A', 10),
(2, 'Produto B', 3),
(3, 'Produto C', 7),
(4, 'Produto D', 2),
(5, 'Produto E', 12);

CREATE VIEW vw_estoque_insuficiente AS
SELECT id, nome, quantidade_em_estoque
FROM produtos
WHERE quantidade_em_estoque < 5;

SELECT * FROM vw_estoque_insuficiente;




