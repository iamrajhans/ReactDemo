React = require('react/addons')
Link = require('react-router').Link
Navigation = require('react-router').Navigation
auth = require('./auth')
flash = require('./flash')

module.exports = React.createClass
  displayName: 'AuthNav'
  mixins: [ Navigation ]

  getInitialState: ->
    signedIn: auth.isSignedIn()

  componentWillMount: ->
    auth.on 'change', =>
      @setState(signedIn: auth.isSignedIn())

  signOut: ->
    flash.next.notice 'Signed out successfully!'
    auth.signOut()
    @transitionTo('home')

  render: ->
    if @state.signedIn
      <ul className="nav">
        <li className="nav__item">Hi Foo!</li>
        <li className="nav__item"><a onClick={@signOut} className="button--alert">Sign out</a></li>
      </ul>
    else
      <ul className="nav">
        <li className="nav__item"><Link activeClassName="is-active" to="sign-in" className="button--primary">Sign in</Link></li>
      </ul>

