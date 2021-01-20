const { pool } = require("../db");

const dashboard = async (req, res) => {
  try {
    const [rows] = await pool.promise().query(`SELECT * FROM ms_user`);
    return res.status(200).json({
      result: rows,
      status: 'sucess',
      cookie: req.cookies.authcookie
    })
  } catch(err) {
    console.log(new Date(), req.method, req.originalUrl, err.message);
    return res.status(500).send('server error');
  }
}

module.exports = {
  dashboard
}