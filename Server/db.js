const Pool = require('pg').Pool;
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'falliti',
    password: 'l',
    port: '5432',
});

module.exports = pool;