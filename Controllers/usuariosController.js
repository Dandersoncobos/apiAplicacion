
const { getGuia, getTrasporte } = require('../Models/usuario');
const Usuario = require('../Models/usuario');

module.exports = {
    
    async getAll( req, res, next){
        try {
            const data = await Usuario.getAll();
            console.log(`Usuario: ${data}`);
            return res.status(200).json(data);

        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: error

            });

        }
    },

    async getGuia(req, res, nmext){
        try {
            const data = await Usuario.getGuia();
            console.log(`Usuario: ${data}`);
            return res.status(200).json(data);

        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: error

            });

        }
    },

    async getTurista(req, res, nmext){
        try {
            const data = await Usuario.getTurista();
            console.log(`Usuario: ${data}`);
            return res.status(200).json(data);

        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: error

            });

        }
    },
    
    async getTrasporte(req, res, nmext){
        try {
            const data = await Usuario.getTrasporte();
            console.log(`Usuario: ${data}`);
            return res.status(200).json(data);

        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: error

            });

        }
    },
};