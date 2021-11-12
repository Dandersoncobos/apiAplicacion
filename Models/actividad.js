const db = require('../config/config');


const Actividad = {};

Actividad.todalActividades = () =>{
    
    const sql = `SELECT * FROM actividad`;

    return db.manyOrNone(sql)
};

module.exports = Actividad;