CREATE DATABASE produtotrigger;
use produtotrigger;

CREATE TABLE produto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  data_validade DATE NOT NULL
);

DELIMITER //
CREATE TRIGGER validar_data_validade_produto
BEFORE INSERT ON produto
FOR EACH ROW
BEGIN
    DECLARE data_atual DATE;
    DECLARE data_validade_produto DATE;
    
    SET data_atual = DATE(NOW());
    SET data_validade_produto = NEW.data_validade;
    
    IF data_validade_produto < data_atual THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data de validade do produto vencida';
    END IF;
END;
//
DELIMITER ;
