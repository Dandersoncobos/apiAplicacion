const Actividad = require("../Controllers/actividadControlador");

module.exports = (app) => {
    app.get('/api/actividad/todas', Actividad.totalActividades);
};