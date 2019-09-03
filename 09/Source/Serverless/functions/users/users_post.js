const mongodb = require('../../lib/mongodb')
const util = require('../../lib/util')
const collectionUsers = 'users'

module.exports = async (event) => {
  try {
    const body = JSON.parse(event.body || '{}')
    if (!body.name) return util.bind(new Error('Enter your name!'))
    if (!body.email) return util.bind(new Error('Enter your email!'))

    await mongodb.connect()

    const checkUserExist = await mongodb(collectionUsers).findOne({ email: body.email })
    if (checkUserExist) return util.bind(new Error('An account with this email already exists!'))

    const user = {
      name: body.name,
      email: body.email
    }

    await mongodb(collectionUsers).insertOne(user)
    return util.bind({})
  } catch (error) {
    return util.bind(error)
  }
}
