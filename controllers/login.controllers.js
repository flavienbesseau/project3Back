const bcrypt = require('bcryptjs');
const { connection } = require("../db");

const { checkUser } = require('../models/login.models');
const { createToken } = require('../services/jwtToken');

const login = async (req, res) => {
  try {
    const { email, password } = req.body;
    const [rows] = await connection.promise().query(checkUser, [email]);
    const { id, name, fk_hospital_id } = rows[0];
    const match = await bcrypt.compare(password, rows[0].password);
      if(match) {
        const token = createToken(id);
        res.cookie('authcookie', token, { httpOnly:true }); 
        return res.status(200).json({
          id, 
          name,
          fk_hospital_id,
          email
        });
      } 
        return res.status(403).json('wrong credentials')
    }
  catch(err) {
    console.log(new Date(), req.method, req.originalUrl, err.message);
    return res.status(500).send('server error');
  }
}

module.exports = {
  login
}