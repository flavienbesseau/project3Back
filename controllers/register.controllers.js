const bcrypt = require('bcryptjs');
const connection = require("../db");

const rounds = 10;
const { createUserModel, getAllUsersModel } = require('../models/registrations.models');

const createUser = async (req, res) => {
  const { name, email, password, fk_hospital_id } = req.body;
  const hash = await bcrypt.hash(password, rounds);
    try {
      await connection.query(createUserModel, [name, email, hash, fk_hospital_id]);
      res.status(200).json({
        success: true,
        status: 'success, user added.',
        createdAccount: true 
      })
    } 
    catch(err) {
      console.log(new Date(), req.method, req.originalUrl, err.message);
      res.status(500).json('server error');
    }
  }

const getUsers = async (req, res) => {
  try {
    const [rows] = await connection.query(getAllUsersModel);
    res.status(200).json(rows);
  } 
  catch(err) {
    console.log(new Date(), req.method, req.originalUrl, err.message);
    res.status(500).send('server error');
  }
}

module.exports = {
  createUser,
  getUsers
}