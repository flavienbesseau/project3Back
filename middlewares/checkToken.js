const jwt = require('jsonwebtoken');

const checkToken = async (req, res, next) => {
  
  const tokenCookie = req.cookies.authcookie;
  
  if(tokenCookie === null || tokenCookie === undefined ) {
    res.status(401).json('You need to provide a valid token');
  }  
  jwt.verify(tokenCookie, process.env.JWT_SECRET, (err, user) => {
    if (err) {
      res.sendStatus(403);
    }
    req.user = user
    next();
  })
}

module.exports = {
  checkToken
} 