Client = require('clearbit').Client
clearbit = new Client({ key: 'sk_9821a8a14a50cb982dbfe57f1068aef7' })
Person = clearbit.Person

ClearbitController = (req, res) ->
  email = req.body.data
  Person.find { email: email }
  .then (person) ->
    console.log person
  .catch Person.QueuedError, (error) ->
    console.log "QueuedError: ", error
  .catch Person.NotFoundError, (error) ->
    console.log "NotFoundError: ", error
  .catch () ->
    console.log 'Bad/invalid request, unauthorized, Clearbit error, or failed request'

module.exports = ClearbitController
