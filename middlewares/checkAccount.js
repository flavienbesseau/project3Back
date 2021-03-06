const { connection } = require("../db");

const checkAccount = async (req, res, next) => {
  try {
    const { email } = req.body;
    const [rows] = await connection
      .promise()
      .query(`SELECT ms_user.email FROM ms_user`);

    const emailExists = await rows.filter((element) => element.email === email);

    if (emailExists.length > 0) {
      res.status(400).json({
        err: {
          errors: ["Email déjà existant"],
          params: {
            path: "email",
          },
        },
      });
    } else {
      next();
    }
  } catch (err) {
    console.log(new Date(), req.method, req.originalUrl, err.message);
    res.status(500).json(err);
  }
};

module.exports = checkAccount;
