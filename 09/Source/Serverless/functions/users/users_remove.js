const mongodb = require('../../lib/mongodb')
const util = require('../../lib/util')
const collectionUsers = 'users'
const { ObjectId } = require('mongodb')

module.exports = async (event) => {
  try {
    const body = JSON.parse(event.body || '{}')
    if (!body._id) return util.bind(new Error('Enter your code!'))

    await mongodb.connect()

    await mongodb(collectionUsers).removeOne({ _id: ObjectId(body._id) })
    return util.bind({})
  } catch (error) {
    return util.bind(error)
  }
}
