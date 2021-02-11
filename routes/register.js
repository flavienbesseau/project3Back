const router = require('express').Router();
const { registerController } = require('../controllers');

const userSchema  = require('../validations/user');
const validation = require('../middlewares/userValidation');
const checkAccount = require('../middlewares/checkAccount');

router.get('/', registerController.getUsers);
router.post('/', checkAccount, validation(userSchema), registerController.createUser);

module.exports = router;