const { MongoClient } = require('mongodb')

let MONGO_DB_URI
let MONGO_HOST = process.env.MONGO_HOST
let MONGO_USER = process.env.MONGO_USER
let MONGO_PASSWORD = process.env.MONGO_PASSWORD
let MONGO_PORT = process.env.MONGO_PORT
let MONGO_DB = process.env.MONGO_DB

/* istanbul ignore next */
if (process.env.NODE_ENV === 'test') {
  MONGO_HOST = process.env.MONGO_HOST_TEST
  MONGO_USER = process.env.MONGO_USER_TEST
  MONGO_PASSWORD = process.env.MONGO_PASSWORD_TEST
  MONGO_PORT = process.env.MONGO_PORT_TEST
  MONGO_DB = process.env.MONGO_DB_TEST
  MONGO_DB_LOCAL = true
} else if (process.env.NODE_ENV === 'flutter') {
  MONGO_HOST = process.env.MONGO_HOST_LOCAL
  MONGO_USER = process.env.MONGO_USER_LOCAL
  MONGO_PASSWORD = process.env.MONGO_PASSWORD_LOCAL
  MONGO_PORT = process.env.MONGO_PORT_LOCAL
  MONGO_DB = process.env.MONGO_DB_LOCAL
  MONGO_DB_LOCAL = true;
} else {
  MONGO_DB_LOCAL = false
}

if (MONGO_DB_LOCAL === true)
  MONGO_DB_URI = `mongodb://${MONGO_USER}:${MONGO_PASSWORD}@${MONGO_HOST}:${MONGO_PORT}/${MONGO_DB}`
else
  // cluster
  MONGO_DB_URI = `mongodb+srv://${MONGO_USER}:${MONGO_PASSWORD}@${MONGO_HOST}/${MONGO_DB}?retryWrites=true`

let connection

const defaultConnectionConfig = {
  ignoreUndefined: true,
  useNewUrlParser: true
}

const getCollection = collectionName => connection.collection(collectionName)

const connect = async () => {
  if (connection && connection.serverConfig.isConnected()) {
    return connection
  }
  const connect = await MongoClient.connect(MONGO_DB_URI, defaultConnectionConfig)
  connection = connect.db(MONGO_DB)
  return connection
}

module.exports = getCollection
module.exports.connect = connect
