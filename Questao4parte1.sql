CREATE DATABASE fieb;
use fieb;

CREATE TABLE produtos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  preco DECIMAL(10, 2) NOT NULL
);

INSERT INTO produtos (nome, preco) VALUES 
('Produto A', 99.99),
('Produto B', 150.50),
('Produto C', 75.25),
('Produto D', 120.00),
('Produto E', 200.00);

CREATE VIEW vw_produtos_caros AS
SELECT id, nome, preco
FROM produtos
WHERE preco > 100.00;

SELECT * FROM vw_produtos_caros;
