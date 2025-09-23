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

const addHolidayPackage = (req, res) => {
    const {destination, price, departure, info, days} = req.body;
    pool.query(queries.addHolidayPackage, [destination, price, departure, info, days], (error, result) => {
        if (error) throw error;
        res.status(201).json({message: 'HolidayPackage added correctly'});
    });
}

module.exports = {
    getHolidayPackages,
    getHolidayPackageById,
    addHolidayPackage
}