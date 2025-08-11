const pool = require('../../db');
const queries = require('./hp_queries.js');

const getHolidayPackages = (req, res) => {
    pool.query(queries.getHolidayPackages, (error, result) => {
        if(error) throw error;
        result.rows.forEach(row => {
            row.departure = row.departure.toISOString().slice(0, 10);
        });
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
    getHolidayPackages,
    getHolidayPackageById
}