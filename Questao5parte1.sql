CREATE DATABASE senaizuei;
use senaizuei;

CREATE TABLE pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  numero_pedido VARCHAR(255) NOT NULL,
  status VARCHAR(255) NOT NULL
);

INSERT INTO pedidos (numero_pedido, status) VALUES 
('1001', 'Entregue'),
('1002', 'Pendente'),
('1003', 'Pendente'),
('1004', 'Enviado'),
('1005', 'Pendente');

CREATE VIEW vw_pedidos_pendentes AS
SELECT id, numero_pedido, status
FROM pedidos
WHERE status = 'Pendente';

SELECT * FROM vw_pedidos_pendentes;

