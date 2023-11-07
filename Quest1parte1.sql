CREATE DATABASE senaifieb;
use senaifieb;

CREATE TABLE Funcionarios (
id int auto_increment primary key,
nome varchar (255) not null,
cargo varchar (45) not null,
departamento varchar (45) not null
);

insert into Funcionarios (nome, cargo, departamento) values ("Vinicius", "Chefe", "Administrativo"),
 ("Pedro", "Estagiario", "Financeiro"),
  ("Joao", "Assistente", "Administrativo");
  
CREATE VIEW vw_Funcionarios_departamento AS
SELECT nome, cargo
FROM Funcionarios
WHERE departamento = 'administrativo';

SELECT * FROM vw_Funcionarios_departamento;


