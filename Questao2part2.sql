CREATE DATABASE senaidocara;
use senaidocara;

CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    preco DECIMAL(10, 2)
);

INSERT INTO produtos (id, nome, preco) VALUES
(1, 'Produto A', 100.00),
(2, 'Produto B', 50.00),
(3, 'Produto C', 75.00);

DELIMITER //
CREATE TRIGGER aumentar_preco_produto
BEFORE UPDATE ON produtos
FOR EACH ROW
BEGIN
    SET NEW.preco = NEW.preco * 1.10;
END;
//
DELIMITER ;

UPDATE produtos
SET preco = 110.00
WHERE id = 1;