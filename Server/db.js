const Pool = require('pg').Pool;
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'travel_io',
    password: 'l',
    port: '5432',
});

module.exports = pool;