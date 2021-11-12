const Guia = require('../Models/guia');

module.exports= {

    async totalGuias( req, res, next){
        try{
            const data = await Guia.totalGuias();
            console.log(`Guia: ${data}`);
            return res.status(200).json(data);
        }catch(error){
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: error
            })
        }
        
    }
}