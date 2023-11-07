CREATE DATABASE funcionariosdemitidos;
use funcionariosdemitidos;

CREATE TABLE tb_funcionarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  cargo VARCHAR(255) NOT NULL
);

CREATE TABLE tb_funcionarios_demitidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  cargo VARCHAR(255) NOT NULL,
  data_demissao DATE NOT NULL
);

DELIMITER //
CREATE TRIGGER after_delete_funcionario
AFTER DELETE ON tb_funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO tb_funcionarios_demitidos (nome, cargo, data_demissao)
    VALUES (OLD.nome, OLD.cargo, DATE(NOW()));
END;
//
DELIMITER ;

INSERT INTO tb_funcionarios (nome, cargo) VALUES
('Funcionario 1', 'Gerente'),
('Funcionario 2', 'Analista'),
('Funcionario 3', 'Assistente');

DELETE FROM tb_funcionarios WHERE id = 2;
