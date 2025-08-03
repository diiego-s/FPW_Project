const pool = require('../../db');
const queries = require('./hp_queries.js');

const getHolidayPackageList = (req, res) => {
    pool.query(queries.getHolidayPackageList, (error, result) => {
        if(error) throw error;
        res.status(200).json(result.rows);
    })
}

const getHolidayPackageById = (req, res) => {
    const id = parseInt(req.params.id);
    pool.query(queries.getHolidayPackageById, [id], (error, result) => {
        if(error) throw error;
        res.status(200).json(result.rows);
    })
}


module.exports = {
    getHolidayPackageList,
    getHolidayPackageById
}