
const reservasController = require('../Controllers/reservasController');

module.exports = (app) =>{

    // obtencion  de reservas
    app.get('/api/reserva/todas' , reservasController.totalReservas);
    
    // Creacionde nuevas reservas
    app.post('/api/reserva/creacion', reservasController.crear);
}
