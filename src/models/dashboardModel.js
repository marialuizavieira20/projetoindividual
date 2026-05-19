var database = require("../database/config");

function buscarMedos() {

  var instrucaoSql = `SELECT a.texto, COUNT(*) AS total
  FROM respostas r
  JOIN alternativas a
  ON r.fkAlternativa = a.idAlternativa
  WHERE r.fkPergunta = 3
  GROUP BY a.texto;`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarPerfis() {
  
  var instrucaoSql = `SELECT a.texto, COUNT(*) AS total
  FROM respostas r
  JOIN alternativas a
  ON r.fkAlternativa = a.idAlternativa
  WHERE r.fkPergunta = 7
  GROUP BY a.texto;`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarCards() {
  var instrucaoSql = `SELECT
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
  ) AS perfilPopular;`;

  return database.executar(instrucaoSql);
}

function buscarEscolhasLugar() {
  var instrucaoSql =
  `SELECT a.texto, COUNT(*) AS total
  FROM respostas r
  JOIN alternativas a
  ON r.fkAlternativa = a.idAlternativa
  WHERE r.fkPergunta = 1
  GROUP BY a.texto;`;
}

module.exports = {
  buscarMedos,
  buscarPerfis,
  buscarCards,
  buscarEscolhasLugar
}
