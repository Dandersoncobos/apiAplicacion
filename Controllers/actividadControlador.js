
const Actividad = require('../Models/actividad');

module.exports = {

    async totalActividades (req, res, next){
        try {
            const data = await Actividad.todalActividades();
            console.log(`Actividad: ${data}`);
            return res.status(200).json(data);
        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: error
            });
        }

    }
};