-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

create database lastcore1;
use lastcore1;

CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  senha VARCHAR(255) NOT NULL,
  codigo_ativacao VARCHAR(50) UNIQUE
);


CREATE TABLE perguntas (
  idPergunta INT AUTO_INCREMENT PRIMARY KEY,
  texto VARCHAR(255) NOT NULL,
  categoria VARCHAR(50)
);

CREATE TABLE alternativas (
    idAlternativa INT AUTO_INCREMENT PRIMARY KEY,
    texto VARCHAR(255) NOT NULL,
    fkPergunta INT NOT NULL,
    FOREIGN KEY (fkPergunta)
        REFERENCES perguntas(idPergunta)
);

  CREATE TABLE respostas (
    fkUsuario INT,
    fkPergunta INT,
    fkAlternativa INT,
    PRIMARY KEY (fkUsuario, fkPergunta),
    FOREIGN KEY (fkUsuario)
        REFERENCES usuarios(id),
    FOREIGN KEY (fkPergunta)
        REFERENCES perguntas(idPergunta),
    FOREIGN KEY (fkAlternativa)
        REFERENCES alternativas(idAlternativa)
);

-- Inserindo usuários com códigos de ativação
INSERT INTO usuarios (nome, email, senha, codigo_ativacao)
VALUES ('Maria Luiza', 'marialuiza@sptech.com', 'Lu123!', 'AEI456');

INSERT INTO usuarios (nome, email, senha, codigo_ativacao)
VALUES ('Carolina Dias', 'caroldias@gmail.com', 'carol875!', 'XPTO26');

INSERT INTO usuarios (nome, email, senha, codigo_ativacao)
VALUES ('Joaquim Veloso', 'joaquimveloso@gmail.com', 'veloso342!', 'CORE13');

SELECT * FROM usuarios;