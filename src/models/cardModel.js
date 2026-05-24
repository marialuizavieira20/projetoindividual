function buscarMissao(idUsuario) {

    var instrucao = `
        SELECT *
        FROM respostas
        WHERE fkUsuario = ${idUsuario};
    `;

    return database.executar(instrucao);
}