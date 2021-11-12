const db = require('../config/config');

const Usuario = {};

Usuario.getAll = () => {
    
    const sql =`SELECT u.*, r.descripcion FROM usuario AS u JOIN rol AS r ON u.id_rol = r.id_rol`;

    return db.manyOrNone(sql);

}

Usuario.getGuia = () => {

    const sql = `SELECT u.*, r.descripcion FROM usuario AS u JOIN rol AS r ON u.id_rol = r.id_rol WHERE u.id_rol = 5`;
    
    return db.manyOrNone(sql);

}

Usuario.getTurista = () => {

    const sql = `SELECT u.*, r.descripcion FROM usuario AS u JOIN rol AS r ON u.id_rol = r.id_rol WHERE u.id_rol = 1`;
    
    return db.manyOrNone(sql);

}

Usuario.getTrasporte = () => {

    const sql = `SELECT u.*, r.descripcion FROM usuario AS u JOIN rol AS r ON u.id_rol = r.id_rol WHERE u.id_rol = 6`;
    
    return db.manyOrNone(sql);

}

module.exports = Usuario;