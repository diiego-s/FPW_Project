const {Router} = require('express');
const controller = require('./users_controller');

const router = Router();

//GET
router.get('/', controller.getUsers);
router.get('/:username', controller.getUserByUsername);

//POST
router.post('/', controller.addUser);

module.exports = router;