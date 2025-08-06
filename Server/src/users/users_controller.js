const pool = require('../../db.js');
const queries = require('./users_queries.js');

const getUsers = (req, res) => {
    pool.query(queries.getUsers, (error, result) => {
        if(error) throw error;
        res.status(200).json(result.rows);
    });
};


module.exports = {
    getUsers
}