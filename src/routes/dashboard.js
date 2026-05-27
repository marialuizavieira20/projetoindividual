var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/medos", function (req, res) {
  dashboardController.buscarMedos(req, res);
});

router.get("/perfis", function(req, res) {
  dashboardController.buscarPerfis(req, res);
});

router.get("/cards", function(req, res) {
  dashboardController.buscarCards(req, res);
});

router.get("/jornada/:idUsuario", function(req, res) {
  dashboardController.buscarCards(req, res);
});

router.get("/taxa/:idUsuario", function(req,res) {
  dashboardController.buscarTaxa(req,res);
});

module.exports = router; 