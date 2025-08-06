const {Router} = require('express');
const controller = require('./users_controller');

const router = Router();

//GET
router.get('/', controller.getUsers);

module.exports = router;