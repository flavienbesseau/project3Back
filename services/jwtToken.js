const jwt = require('jsonwebtoken');

const createToken = ( id ) => {
  const token = jwt.sign({
    data: id,
    exp: Math.floor(Date.now() / 1000) + (60 * 60) // 1 hour expiration
  },
  process.env.JWT_SECRET);
  return token;
}

module.exports = {
  createToken
}