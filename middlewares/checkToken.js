const jwt = require('jsonwebtoken');

const checkToken = (req, res, next) => {
  const tokenCookie = req.cookies.authcookie;

  if(tokenCookie) {
    jwt.verify(tokenCookie, process.env.JWT_SECRET, (err, user) => {
      if(err) {
        res.status(403).send('Token is incorrect.');
      }
      req.user = user;
       next();
    })
  } else {
     res.status(401).send('You need to provide a valid token');
  }
}

module.exports = {
  checkToken
} 