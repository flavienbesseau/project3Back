const validation = (schema) => async (req, res, next) => {
  try {
    const {body} = req;  
    await schema.validate(body)
    next();

  } catch(err) {
    console.log(new Date(), req.method, req.originalUrl, err.message);
    res.status(400).json({ err });
  }
}

module.exports = validation