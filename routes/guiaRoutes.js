const Guia = require("../Controllers/guiaController");

module.exports= (app) =>{
    app.get('/api/guia/todos', Guia.totalGuias); 
};