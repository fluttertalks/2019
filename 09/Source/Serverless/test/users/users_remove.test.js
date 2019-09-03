require('dotenv').config()
const mongodb = require('./../../lib/mongodb')
const { ObjectId } = require('mongodb')
const usersRemove = require('./../../functions/users/users_remove')

const collectionUsers = 'users'

describe('users/users_remove.js', () => {
  beforeAll(async () => {
    try {
      await mongodb.connect()
      await mongodb(collectionUsers).insertOne({ email: 'removetest@test.com', _id: ObjectId('5c326feaf8a79d378757bed0') })
    } catch (error) {
      console.log('error -> ', error)
    }
  })
  afterAll(async () => {
    try {
      await mongodb(collectionUsers).removeOne({ email: 'removetest@test.com' })
    } catch (error) {
      console.log('error -> ', error)
    }
  })
  describe('Should success', () => {
    it('valid code user', async () => {
      const event = {}
      const res = await usersRemove(event)
      expect(res.statusCode).toBe(400)
    })
    it('remove user', async () => {
      const event = {
        body: JSON.stringify({
          _id: '5c326feaf8a79d378757bed0'
        })
      }
      const res = await usersRemove(event)
      expect(res.statusCode).toBe(200)
    })
  })
  describe('Should fail', () => {
    it('should return an error event not send', async () => {
      const res = await usersRemove()
      expect(res.statusCode).toBe(400)
    })
  })
})
