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


CREATE TABLE respostas (
  usuario_id INT NOT NULL,
  pergunta_idPergunta INT NOT NULL,
  resposta VARCHAR(255) NOT NULL,
  PRIMARY KEY (usuario_id, pergunta_idPergunta),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (pergunta_idPergunta) REFERENCES perguntas(idPergunta)
);

-- Inserindo usuários com códigos de ativação
INSERT INTO usuarios (nome, email, senha, codigo_ativacao)
VALUES ('Maria Luiza', 'marialuiza@sptech.com', 'Lu123!', 'AEI456');

INSERT INTO usuarios (nome, email, senha, codigo_ativacao)
VALUES ('Carolina Dias', 'caroldias@gmail.com', 'carol875!', 'XPTO26');

INSERT INTO usuarios (nome, email, senha, codigo_ativacao)
VALUES ('Joaquim Veloso', 'joaquimveloso@gmail.com', 'veloso342!', 'CORE13');

