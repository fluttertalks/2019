require('dotenv').config()
const mongodb = require('./../../lib/mongodb')
const usersPost = require('./../../functions/users/users_post')

const collectionUsers = 'users'

describe('users/users_post.js', () => {
  beforeAll(async () => {
    try {
      await mongodb.connect()
      await mongodb(collectionUsers).insertOne({ email: 'othertest@test.com' })
    } catch (error) {
      console.log('error -> ', error)
    }
  })
  afterAll(async () => {
    try {
      await mongodb(collectionUsers).removeOne({ email: 'othertest@test.com' })
      await mongodb(collectionUsers).removeOne({ email: 'test@test.com' })
    } catch (error) {
      console.log('error -> ', error)
    }
  })
  describe('Should success', () => {
    it('valid user', async () => {
      const event = {
        body: JSON.stringify({
          name: 'user test name'
        })
      }
      const res = await usersPost(event)
      expect(res.statusCode).toBe(400)
    })
    it('should add a new user', async () => {
      const event = {
        body: JSON.stringify({
          name: 'user test name',
          email: 'test@test.com'
        })
      }
      const res = await usersPost(event)
      expect(res.statusCode).toBe(200)
    })
    it('should test email', async () => {
      const event = {
        body: JSON.stringify({
          name: 'user othertest',
          email: 'othertest@test.com'
        })
      }
      const res = await usersPost(event)
      const body = JSON.parse(res.body)
      expect(res.statusCode).toBe(400)
      expect(body).toHaveProperty('errorMessage')
    })
  })
  describe('Should fail', () => {
    it('should return an error body not send', async () => {
      const res = await usersPost()
      expect(res.statusCode).toBe(400)
    })
    it('should return valid user empty', async () => {
      const res = await usersPost({ body: '' })
      expect(res.statusCode).toBe(400)
    })
  })
})
