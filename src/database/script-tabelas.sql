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
  senha VARCHAR(255) NOT NULL
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
INSERT INTO usuarios (nome, email, senha)
VALUES ('Maria Luiza', 'marialuiza@sptech.com', 'Lu123!');

INSERT INTO usuarios (nome, email, senha)
VALUES ('Carolina Dias', 'caroldias@gmail.com', 'carol875!');

INSERT INTO usuarios (nome, email, senha)
VALUES ('Joaquim Veloso', 'joaquimveloso@gmail.com', 'veloso342!');

-- Inserindo as perguntas
INSERT INTO perguntas (idPergunta, texto, categoria) VALUES
(1, 'Em um cenário pós-apocalíptico, qual lugar você escolheria para viver?', 'Local'),
(2, 'Se depois de alguns dias, faltasse comida e mantimentos, o que você faria?', 'Comida'),
(3, 'O que mais te causaria medo?', 'Medo'),
(4, 'Como você resolveria os seus conflitos?', 'Conflito'),
(5, 'O que mais importa?', 'Importância'),
(6, 'Se você encontrasse um desconhecido ferido à beira da morte, o que faria?', 'Desconhecido'),
(7, 'Que tipo de pessoa você acredita seria nesse ambiente?', 'Perfil');

-- Inserindo as alternativas
INSERT INTO alternativas (idAlternativa, texto, fkPergunta) VALUES
(1, 'Seattle', 1),
(2, 'Santa Barbara', 1),
(3, 'Atlanta', 1),
(4, 'Silver Lake', 1),
(5, 'Dividiria o pouco que tenho, até a alguma gota de água', 2),
(6, 'Me juntaria em equipe para buscar mantimentos', 2),
(7, 'Tentaria negociar recursos se estivesse em larga escala de pessoas', 2),
(8, 'Procuraria comida sozinho, deixando minha equipe de fora', 2),
(9, 'Ficar sozinho no meio do apocalipse', 3),
(10, 'Perder pessoas importantes na minha vida', 3),
(11, 'Ser mordido e morrer por conta dos infectados', 3),
(12, 'Pessoas perigosas e gangues', 3),
(13, 'Tentaria conversar, para não tomar nenhuma atitude precipitada', 4),
(14, 'Resolveria na força bruta, pois seria a única maneira', 4),
(15, 'Criaria uma estratégia para analisar a melhor ação naquele cenário', 4),
(16, 'Tentaria evitar a conversa ao máximo, em prol da sobrevivência', 4),
(17, 'Proteger a minha família e aqueles que amo', 5),
(18, 'Ter liberdade e poder fazer o meu caminho sozinho', 5),
(19, 'Garantir sempre a minha sobrevivência, custe o que custar', 5),
(20, 'Ter sempre um pingo de esperança, tentando observar algum caminho otimista', 5),
(21, 'Iria ajudar sem nem pensar duas vezes', 6),
(22, 'Eu ajudaria, mas tomaria todo o cuidado e ficaria em alerta a todo momento', 6),
(23, 'Iria embora, afinal, não é um problema meu', 6),
(24, 'Observaria com bastante cautela, antes de tomar qualquer decisão', 6),
(25, 'Seria um líder no meu grupo, tomando sempre a iniciativa com coragem', 7),
(26, 'Seria um sobrevivente, que agiria de forma silenciosa', 7),
(27, 'Iria ser muito protetor com todos, lutando sempre pelo meu grupo', 7),
(28, 'Seria um explorador, caminhando sozinho para sobreviver', 7);

SELECT * FROM usuarios;
SELECT * FROM perguntas;
SELECT * FROM respostas;
SELECT * FROM alternativas;

SELECT a.texto, COUNT(*) AS total
  FROM respostas r
  JOIN alternativas a
  ON r.fkAlternativa = a.idAlternativa
  WHERE r.fkPergunta = 7
  GROUP BY a.texto;
  
  SELECT
  (SELECT COUNT(*) FROM usuarios) AS totalUsuarios,
  (SELECT COUNT(*) FROM respostas) AS totalRespostas,
  (
    SELECT a.texto
    FROM respostas r
    JOIN alternativas a
    ON r.fkAlternativa = a.idAlternativa
    WHERE r.fkPergunta = 7
    GROUP BY a.texto
    ORDER BY COUNT(*) DESC
    LIMIT 1
  ) AS perfilPopular,
  
  SELECT a.texto, COUNT(*) AS total
  FROM respostas r
  JOIN alternativas a
  ON r.fkAlternativa = a.idAlternativa
  WHERE r.fkPergunta = 1
  GROUP BY a.texto;

  SELECT p.categoria, a.texto, r.fkAlternativa
  FROM respostas r
  JOIN alternativas a ON r.fkAlternativa = a.idAlternativa
  JOIN perguntas p ON r.fkPergunta = p.idPergunta
  WHERE r.fkUsuario = ${idUsuario}
  ORDER BY r.fkPergunta;

SELECT
(SELECT COUNT(*) FROM usuarios) AS totalUsuarios,
(SELECT COUNT(*) FROM respostas r2
WHERE r2.fkpergunta = 1
AND r2.fkAlternativa = (
  SELECT fkAlternativa FROM respostas
  WHERE fkUsuario = ${idUsuario}
  AND fkPergunta = 1
)) AS mesmoLugarUsuarios,

(SELECT a.texto FROM respostas r3
  JOIN alternativas a ON r3.fkAlternativa = a.idAlternativa
  WHERE r3.fkUsuario = ${idUsuario}
  AND r3.fkPergunta = 1) AS lugarEscolhido;
  
