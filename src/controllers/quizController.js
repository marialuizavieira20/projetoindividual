var quizModel = require("../models/quizModel");

function salvarRespostas(req, res) {
    var idUsuario = req.body.idUsuario;
    var respostas = req.body.respostas;

    if (!idUsuario || !respostas || respostas.length === 0) {
        return res.status(400).json({mensagem: "Dados Inválidos."});
    }

    quizModel.salvarRespostas(idUsuario, respostas) 
     .then(function(resultado) {
        res.status(201).json({mensagem: "Respostas salvas com sucesso!"});
     })

     .catch(function(erro) {
        console.log(erro);
        res.status(500).json(erro,sqlMessage);
     });
}

     module.exports = {
        salvarRespostas
     };