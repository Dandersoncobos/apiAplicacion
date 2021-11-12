const usuariosController = require('../Controllers/usuariosController');

module.exports = (app) =>{
    //llamdo a todos lo usuarios
    app.get('/api/usuarios/gatAll' , usuariosController.getAll);

    //llamdo a los usuarios con el rol guia
    app.get('/api/usuario/guia', usuariosController.getGuia);

    //llamdoa los usuarios con el rol turista
    app.get("/api/usuario/turista", usuariosController.getTurista);

    //llamdo a los usuarios con el rol transporte
    app.get("/api/usuario/transporte", usuariosController.getTrasporte);


}