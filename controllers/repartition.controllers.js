const connection = require("../db");

const repartition = async (req, res) => {
  try {
    const { id } = req.params
    const [rows] = await connection.query(`SELECT * FROM ms_response WHERE fk_hospital_id = ?`, [id]);

    const hospWithBloc = rows.filter(score => score.fk_experience_id === 1 ).length;  
    const hospWithoutBloc = rows.filter(score => score.fk_experience_id === 2 ).length;  
    const ambWithoutBloc = rows.filter(score => score.fk_experience_id === 3 ).length;  
    const ambWithBloc = rows.filter(score => score.fk_experience_id === 4 ).length;  
    const emergencies = rows.filter(score => score.fk_experience_id === 5 ).length;  
    const maternities = rows.filter(score => score.fk_experience_id === 6 ).length;  

    res.status(200).json({
      hospWithBloc,
      hospWithoutBloc,
      ambWithoutBloc,
      ambWithBloc,
      emergencies,
      maternities
    });
  } 
  catch(err) {
    console.log(new Date(), req.method, req.originalUrl, err.message);
    res.status(500).send('server error');
  }
}

module.exports = {
  repartition
}