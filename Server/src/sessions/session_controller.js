const pool = require('../../db');
const queries = require('./session_queries');

const login = (req, res) => {
    const {username, password} = req.body;
    pool.query(queries.usernameExist, [username], (error, result) => {
        if(error) throw error;
        if(result.rows.length > 0){
            pool.query(queries.login, [username, password], (error, results) => {
                if(error) throw error;
                if(results.rows.length > 0) {
                    req.session.userId = results.rows[0].username;
                    res.status(200).json(req.session);
                } else {
                    res.status(401).json({message: 'Invalid username or password'});
                }
            })  
        } else {
            res.status(401).json({message: 'User not registered'});
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

const changePsw = (req, res) => {
    const { username, oldPassword, newPassword } = req.body;
    pool.query(queries.usernameExist, [username], (error, result) => {
        if (error) throw error;
        if (result.rows.length > 0) {
            pool.query(queries.login, [username, oldPassword], (error, results) => {
                if (error) throw error;
                if (results.rows.length > 0) {
                    pool.query(queries.changePsw, [username, oldPassword, newPassword], (error, updateResult) => {
                        if (error) throw error;
                        if (updateResult.rowCount > 0) {
                            res.status(200).json({message: 'Password updated successfully'});
                        } else {
                            res.status(500).json({ message: 'Unexpected error while updating password' });
                        }
                    })
                } else {
                    res.status(401).json({ message: 'Invalid current password' });
                }
            })
        } else {
            res.status(401).json({ message: 'User not found' });
        }
    });
};

module.exports = {
    login,
    logout,
    isLogged,
    changePsw
}