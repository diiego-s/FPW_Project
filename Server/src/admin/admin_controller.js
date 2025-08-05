const pool = require('../../db.js');
const queries = require('./admin_queries.js');

const getAdmin = (req, res) => {
    pool.query(queries.getAdmin, (error, result) => {
        if(error) throw error;
        res.status(200).json(result.rows);
    });
};


module.exports = {
    getAdmin
}