const mongodb = require('../../lib/mongodb')
const util = require('../../lib/util')
const collectionUsers = 'users'
const { ObjectId } = require('mongodb')

module.exports = async (event) => {
  try {
    const body = JSON.parse(event.body || '{}')
    if (!body._id) return util.bind(new Error('Enter your code!'))
    if (!body.email) return util.bind(new Error('Enter your email!'))

    await mongodb.connect()

    const user = {
      name: body.name,
      email: body.email
    }

    await mongodb(collectionUsers).updateOne(
      {
        _id: ObjectId(body._id)
      },
      {
        $set: user
      }
    )
    return util.bind({})
  } catch (error) {
    return util.bind(error)
  }
}
