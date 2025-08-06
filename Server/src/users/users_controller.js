const pool = require('../../db.js');
const queries = require('./users_queries.js');

const getUsers = (req, res) => {
    pool.query(queries.getUsers, (error, result) => {
        if(error) throw error;
        res.status(200).json(result.rows);
    });
};

const getUserByUsername = (req, res) => {
    const username = req.params.username;
    pool.query(queries.getUserByUsername, [username], (error, result) => {
        if(error) throw error;
        res.status(200).json(result.rows);
    });
}

const addUser = (req, res) => {
    const {username, password, name, surname, email, city, favcity} = req.body;
    pool.query(queries.getUserByUsername, [username], (error, result) => {
        if(error) throw error;
        if(result.rows.length > 0) {
            res.status(400).json({message: 'User already exists'});
        } else {
            pool.query(queries.addUser, [username, password, name, surname, email, city, favcity], (error, result) => {
                if(error) throw error;
                res.status(201).json({message: 'User added correctly'});
            })
        }
    })
}


module.exports = {
    getUsers,
    getUserByUsername,
    addUser
}