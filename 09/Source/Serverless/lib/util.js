const bind = (data) => {
  let statusCode = 200
  if (data.toString().indexOf('Error:') !== -1) {
    statusCode = 400
    data = { errorMessage: data.errorMessage || data.toString().replace('Error:', '') }
  }

  return {
    statusCode,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': true
    },
    body: JSON.stringify(data)
  }
}

module.exports = {
  bind
}
