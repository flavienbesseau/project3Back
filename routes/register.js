const router = require('express').Router();
const { registerController } = require('../controllers');

const userSchema  = require('../validations/user');
const validation = require('../middlewares/userValidation');

router.get('/', registerController.getUsers);
router.post('/', validation(userSchema), registerController.createUser);

module.exports = router;