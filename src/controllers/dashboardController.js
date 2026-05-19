var dashboarMdodel = require("../models/dashboardModel");

function buscarMedos(req, res) {
dashboardModel.buscarMedos() 
  .then(function(resultado) {
    res.json(resultado);
  })
  .catch(function(erro) {
    console.log(erro);
    res.status(500).json(erro.sqlMessage);
  });
}

function buscarPerfis(req, res) {
  dashboardModel.buscarPerfis()
  .then(function(resultado) {
    res.json(resultado);
  })
  .catch(function(erro) {
    console.log(erro);
    res.status(500).json(erro.sqlMessage);
  });
}

function buscarCards(req, res) {
  dashboardModel.buscarCards()
  .then(function(resultado) {
    res.json(resultado[0]);
  })
  .catch(function(erro) {
    console.log(erro);
    res.status(500).json(erro.sqlMessage);
  });
}

function buscarEscolhasLugar(req, res) {
  dashboardModel.buscarEscolhasLugar()
  .then(function(resultado) {
    res.json(resultado[0]);
  })
  .catch(function(erro) {
    console.log(erro);
    res.status(500).json(erro.sqlMessage);
  });
}

module.exports = {
  buscarMedos,
  buscarPerfis,
  buscarCards,
  buscarEscolhasLugar
}