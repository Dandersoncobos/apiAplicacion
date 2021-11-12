const db = require('../config/config');

const Reserva = {};

Reserva.totalReservas = () =>{

    const sql =`SELECT id_reserva, estado_reserva, nombre_actividad, nombre_turista, nombre_guia, nombre_transporte
	FROM public."datos de la reserva";`;

    return db.manyOrNone(sql);

};

Reserva.crear= (Reserva) =>{

    const sql =` INSERT INTO public.reserva(
        id_actividad, id_guia, id_turista, id_transporte, estado_reserva)
        VALUES ($1, $2, $3, $4, $5 ) RETURNING id_reserva`;

    return db.oneOrNone(sql, [
        Reserva.id_actividad,
        Reserva.id_guia,
        Reserva.id_turista,
        Reserva.id_transporte,
        Reserva.estado_reserva
    ])
}


module.exports = Reserva;