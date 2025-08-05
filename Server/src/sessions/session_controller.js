const pool = require('../../db');
const queries = require('./session_queries');

const login = (req, res) => {
    const {username, password} = req.body;
    pool.query(queries.login, [username, password], (error, results) => {
        if(error) throw error;
        if(results.rows.length > 0) {
            req.session.userId = results.rows[0].username;
            res.status(200).json(req.session);
        } else {
            res.status(401).json({message: 'Invalid username or password'});
        }
    })
}

const logout = (req, res) => {
    if(req.session.userId){
        req.session.destroy();
        res.status(200).json({message: "Logged out successfully" });
    } else {
        res.status(401).json({message: "No user logged in"});
    }
}

const isLogged = (req, res) => {
    if(req.session.userId){
        res.status(200).json(req.session);
    } else {
        res.status(401).json({message: "No user logged in"})
    }
}

module.exports = {
    login,
    logout,
    isLogged
}