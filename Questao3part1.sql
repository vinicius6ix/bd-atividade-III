CREATE DATABASE atvcarlos;
use atvcarlos;

CREATE TABLE vendedor (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL
);

INSERT INTO vendedor (nome) VALUES
('Vendedor A'),
('Vendedor B'),
('Vendedor C');

CREATE TABLE cliente (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  vendedor_id INT NOT NULL,
  FOREIGN KEY (vendedor_id) REFERENCES vendedor(id)
);

INSERT INTO cliente (nome, vendedor_id) VALUES
('Cliente 1', 1),
('Cliente 2', 2),
('Cliente 3', 1),
('Cliente 4', 3);

CREATE VIEW vw_relacionamento_cliente_vendedor AS
SELECT c.id AS cliente_id, c.nome AS cliente_nome, v.id AS vendedor_id, v.nome AS vendedor_nome
FROM cliente c
JOIN vendedor v ON c.vendedor_id = v.id;


SELECT * FROM vendedor