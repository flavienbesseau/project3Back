const router = require('express').Router();
const { loginController } = require('../controllers')
const { checkToken } = require('../middlewares/checkToken');

router.get('/', checkToken, loginController.getSession);
router.post('/', loginController.login);

module.exports = router;