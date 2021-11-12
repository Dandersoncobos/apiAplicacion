
const Reserva = require('../Models/reserva');


module.exports ={

    async totalReservas (req, res, next){
        try {
            const data = await Reserva.totalReservas();
            console.log(`Reserva: ${data}`);
            return res.status(200).json(data);

        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: error

            });
        }
    },

    async crear(req, res, next){
        try {
            const reserva =req.body;
            const data = await Reserva.crear(reserva);
            return res.status(201).json({
                success: true,
                message: 'reserva comensada',
                data: data.id
            });
        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'error en la creacion de la actividad', 
                error: error
            });
        }
    }
};

