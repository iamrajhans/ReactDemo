React = require('react/addons')

auth = require('./auth')
SigninForm = require('./signin_form')
flash = require('./flash')

module.exports = React.createClass
  displayName: 'Private'

  statics:
    willTransitionTo: (transition, params) ->
      unless auth.isSignedIn()
        flash.next.alert 'You need to sign in first!'
        SigninForm.pendingTransition = transition
        transition.redirect('sign-in')

  render: ->
    <div>
      <@props.activeRouteHandler />
    </div>

