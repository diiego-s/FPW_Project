const {Router} = require('express');
const controller = require('./session_controller');

const router = Router();

router.post('/login', controller.login);
router.post('/logout', controller.logout);
router.get('/isLogged', controller.isLogged);
router.post('/changePsw', controller.changePsw);

module.exports = router;