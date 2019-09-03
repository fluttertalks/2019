require('dotenv').config()
const mongodb = require('./../../lib/mongodb')
const { ObjectId } = require('mongodb')
const usersPut = require('./../../functions/users/users_put')

const collectionUsers = 'users'

describe('users/users_put.js', () => {
  beforeAll(async () => {
    try {
      await mongodb.connect()
      await mongodb(collectionUsers).insertOne({ email: 'puttest@test.com', _id: ObjectId('5c326feaf8a79d378757bed0') })
    } catch (error) {
      console.log('error -> ', error)
    }
  })
  afterAll(async () => {
    try {
      await mongodb(collectionUsers).removeOne({ email: 'puttest@test.com' })
    } catch (error) {
      console.log('error -> ', error)
    }
  })
  describe('Should success', () => {
    it('update user', async () => {
      const event = {
        body: JSON.stringify({
          _id: '5c326feaf8a79d378757bed0',
          name: 'nameputtest',
          email: 'puttest@test.com'
        })
      }
      const res = await usersPut(event)
      expect(res.statusCode).toBe(200)
    })
    it('valid code user', async () => {
      const event = {}
      const res = await usersPut(event)
      expect(res.statusCode).toBe(400)
    })
    it('valid email user', async () => {
      const event = {
        body: JSON.stringify({
          _id: '5c326feaf8a79d378757bed0'
        })
      }
      const res = await usersPut(event)
      expect(res.statusCode).toBe(400)
    })
  })
  describe('Should fail', () => {
    it('should return an error event not send', async () => {
      const res = await usersPut()
      expect(res.statusCode).toBe(400)
    })
  })
})
