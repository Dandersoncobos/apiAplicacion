const promise = require('bluebird');
const options = {
    promiseLib: promise,
    query: (e) => {}
};


const pgp = require('pg-promise')(options);
const types = pgp.pg.types;
types.setTypeParser(1114, function (strinfValue) {
    return strinfValue;
});

const databaseCofig = {
    'host': 'localhost',
    'port':  5432,
    'database': 'appTurismo',
    'user': "postgres",
    'password': 'Diego970825'

};

const db = pgp(databaseCofig);

module.exports = db;