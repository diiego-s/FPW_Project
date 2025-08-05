const {Router} = require('express');
const controller = require('./admin_controller');

const router = Router();

//GET
router.get('/', controller.getAdmin);

module.exports = router;