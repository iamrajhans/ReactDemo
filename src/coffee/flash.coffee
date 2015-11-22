EventEmitter = require('events').EventEmitter

nextData = {}

next = {
  notice: (message) -> nextData.notice = message
  alert: (message) -> nextData.alert = message
}

class Flash extends EventEmitter
  notice: (message) ->
    @emit('change', notice: message)

  alert: (message) ->
    @emit('change', alert: message)

  next: next

  pageChanged: ->
    @emit('change', nextData)
    nextData = {}

module.exports = new Flash()

