var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n function autenticar(): ", email, senha);
    var instrucaoSql = `
        SELECT id, nome, email, codigo_ativacao 
        FROM usuarios 
        WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function cadastrar(nome, email, senha, codigoAtivacao) {
    console.log("ACESSEI O USUARIO MODEL \n function cadastrar():", nome, email, senha, codigoAtivacao);
    
    var instrucaoSql = `
        INSERT INTO usuarios (nome, email, senha, codigo_ativacao) 
        VALUES ('${nome}', '${email}', '${senha}', '${codigoAtivacao}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar
};
