React = require('react/addons')
_ = require('lodash')

module.exports = React.createClass
  displayName: 'InputField'

  getInitialState: ->
    error: false

  componentDidMount: ->
    @validate() if @rawValue()

  render: ->
    props = _.omit(@props, 'label', 'validator')

    errorField = if @state.error
      <p className="form__error">{ @state.error }</p>

    fieldClass = React.addons.classSet(
      'form__field': true
      'form__field--invalid': @state.error
    )

    <div className={ fieldClass }>
      <label className="form__label">{ @props.label }</label>
      <input className="form__input" ref="input" {... props} onChange={ @validate } />
      { errorField }
    </div>

  validate: ->
    @setState(error: @errors()[0])

  setError: (error) ->
    @setState(error: error)

  rawValue: ->
    @refs.input.getDOMNode().value

  errors: ->
    return [] unless @props.validator
    @props.validator(@rawValue())

  isValid: ->
    @errors().length == 0

  value: ->
    if @isValid()
      @rawValue()

