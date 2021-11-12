const db = require('../config/config');

const Guia ={};

Guia.totalGuias = () =>{
    const sql = `SELECT gu.*, us.nombre , us.apellido 
    FROM guia AS gu join usuario AS us ON us.id_usuario = gu.id_usuario 
    WHERE us.id_rol = 5`;

    return db.manyOrNone(sql);
};

module.exports = Guia;
