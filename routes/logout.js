const router = require('express').Router();

router.get('/', (req, res) => {
  res.clearCookie('authcookie').end();
});

module.exports = router;