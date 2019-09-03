const mongodb = require('../../lib/mongodb')
const util = require('../../lib/util')
const { ObjectId } = require('mongodb')
const collectionUsers = 'users'

module.exports = async (event) => {
  try { 
    await mongodb.connect()
    const perPage = 50
    const page = event.queryStringParameters && event.queryStringParameters.page ? event.queryStringParameters.page : 1

    if (event.pathParameters && event.pathParameters.id) {
      const user = await mongodb(collectionUsers).findOne({ _id: ObjectId(event.pathParameters.id) })
      return util.bind(user)
    }

    const users = await mongodb(collectionUsers).find({}).skip(perPage * page - perPage).limit(perPage).toArray()
    return util.bind(users)
  } catch (error) {
    return util.bind(error)
  }
}
