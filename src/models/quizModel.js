var database = require("../database/config");

function salvarRespostas(idUsuario, respostas) {
    var valores = respostas.map(function(resposta) {
        return `(${idUsuario}, ${resposta.fkPergunta}, ${resposta.fkAlternativa})`;
    });

    var instrucaoSql = `INSERT INTO respostas (fkUsuario, fkPergunta, fkAlternativa)
    VALUES ${valores.join(", ")}; `;

    console.log("Executando SQL:\n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
    
    module.exports = {
        salvarRespostas
    };