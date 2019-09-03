require('dotenv').config()
const mongodb = require('./../../lib/mongodb')
const { ObjectId } = require('mongodb')
const usersGet = require('./../../functions/users/users_get')

const collectionUsers = 'users'

describe('users/users_get.js', () => {
  beforeAll(async () => {
    try {
      await mongodb.connect()
      await mongodb(collectionUsers).insertOne({ email: 'gettest@test.com', _id: ObjectId('5c326feaf8a79d378757bed0') })
    } catch (error) {
      console.log('error -> ', error)
    }
  })
  afterAll(async () => {
    try {
      await mongodb(collectionUsers).removeOne({ email: 'gettest@test.com' })
    } catch (error) {
      console.log('error -> ', error)
    }
  })
  describe('Should success', () => {
    it('return all users', async () => {
      const event = {}
      const res = await usersGet(event)
      const body = JSON.parse(res.body)
      expect(res.statusCode).toBe(200)
      expect(body.length).toBeGreaterThanOrEqual(1)
    })
    it('return an user', async () => {
      const event = {
        pathParameters: {
          id: '5c326feaf8a79d378757bed0'
        }
      }
      const res = await usersGet(event)
      const body = JSON.parse(res.body)
      expect(res.statusCode).toBe(200)
      expect(body.email).toBe('gettest@test.com')
    })
    it('return second page', async () => {
      const event = {
        queryStringParameters: {
          page: 2
        }
      }
      const res = await usersGet(event)
      expect(res.statusCode).toBe(200)
    })
  })
  describe('Should fail', () => {
    it('should return an error event not send', async () => {
      const res = await usersGet()
      expect(res.statusCode).toBe(400)
    })
  })
})
