React = require('react/addons')
Link = require('react-router').Link

AuthNav = require('./auth_nav')
FlashMessages = require('./flash_messages')

module.exports = React.createClass
  displayName: 'App'

  render: ->
    <div>
      <div className="space--both-3">
        <div className="wrap">
          <div className="or">
            <div className="or__item">
              <ul className="nav--dots">
                <li className="nav__item"><Link activeClassName="is-active" to="home">Home</Link></li>
                <li className="nav__item"><Link activeClassName="is-active" to="private">Private</Link></li>
              </ul>
            </div>
            <div className="or__item">
              <AuthNav />
            </div>
          </div>
        </div>
      </div>
      <div className="space--both-3">
        <FlashMessages/>
        <div className="wrap">
          <@props.activeRouteHandler />
        </div>
      </div>
    </div>

