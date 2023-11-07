CREATE DATABASE Empresasf;
use Empresasf;

CREATE TABLE tb_funcionarios (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    cargo VARCHAR(255),
    salario DECIMAL(10, 2)
);

CREATE TABLE tb_dependentes (
    id INT PRIMARY KEY,
    funcionario_id INT,
    nome VARCHAR(255),
    parentesco VARCHAR(255)
);

DELIMITER //
CREATE TRIGGER excluir_dependentes_quando_funcionario_eh_deletado
AFTER DELETE ON tb_funcionarios
FOR EACH ROW
BEGIN
    DELETE FROM tb_dependentes
    WHERE funcionario_id = OLD.id;
END;
//
DELIMITER ;

INSERT INTO tb_funcionarios (id, nome, cargo, salario) VALUES
(1, 'Funcionario A', 'Analista', 5000.00),
(2, 'Funcionario B', 'Gerente', 8000.00);

INSERT INTO tb_dependentes (id, funcionario_id, nome, parentesco) VALUES
(1, 1, 'Dependente A', 'Filho'),
(2, 1, 'Dependente B', 'Esposa'),
(3, 2, 'Dependente C', 'Filho');
