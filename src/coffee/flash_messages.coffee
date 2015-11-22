React = require('react/addons')
_ = require('lodash')

flash = require('./flash')

module.exports = React.createClass
  displayName: 'FlashMessages'

  getInitialState: ->
    messages: {}

  componentWillMount: ->
    flash.on 'change', (data) =>
      @setState(messages: data)

  render: ->
    return null if _.size(@state.messages) == 0

    messages = for type, message of @state.messages
      <div className={"flash--#{type}"}>{ message }</div>

    <div className="wrap space--bottom-3">
      {messages}
    </div>

