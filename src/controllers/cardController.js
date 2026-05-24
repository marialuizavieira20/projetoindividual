function buscarMissao(req, res) {

    var idUsuario = req.params.idUsuario;

    usuarioModel.buscarMissao(idUsuario)
        .then(function(resultado) {
            res.json(resultado[0]);
        });
}