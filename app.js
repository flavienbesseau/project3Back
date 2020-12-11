const express = require('express');
const cors = require('cors');
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');
const { inTestEnv, inProdEnv, SERVER_PORT } = require('./env');

const app = express();

// docs
if (!inProdEnv && !inTestEnv) {
  const swaggerDocument = YAML.load('./docs/swagger.yaml');
  app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
}


// pre-route middlewares
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// routes
require('./routes')(app);

// server setup
const server = app.listen(SERVER_PORT, () => {
  if (!inTestEnv) {
    console.log(`Server running on port ${SERVER_PORT}`);
  }
});

module.exports = server;
