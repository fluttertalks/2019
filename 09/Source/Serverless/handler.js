'use strict'

require('dotenv').config()
const path = require('path')

const users = require(path.join(__dirname, 'functions', 'users'))

module.exports = {
  users: (event, context) => {
    if (event.resource === '/users' && event.httpMethod === 'GET') return users.get(event, context)
    if (event.resource === '/users' && event.httpMethod === 'POST') return users.post(event, context)
    if (event.resource === '/users' && event.httpMethod === 'PUT') return users.put(event, context)
    if (event.resource === '/users' && event.httpMethod === 'DELETE') return users.remove(event, context)
    if (event.resource === '/users/{id}' && event.httpMethod === 'GET') return users.get(event, context)
  }
}
