EventEmitter = require('events').EventEmitter

isSignedIn = false

class Auth extends EventEmitter
  signIn: ->
    localStorage['isSignedIn'] = true
    @emitChange()

  signOut: ->
    localStorage.removeItem('isSignedIn')
    @emitChange()

  isSignedIn: ->
    localStorage['isSignedIn']

  emitChange: ->
    @emit 'change'

module.exports = new Auth()

