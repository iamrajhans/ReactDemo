React = require('react/addons')
nod = require('nod-validation')
_ = require('lodash')
Navigation = require('react-router').Navigation

checks = require('./checks')
flash = require('./flash')
InputField = require('./input_field')
auth = require('./auth')

SigninForm = React.createClass
  displayName: 'SigninForm'
  mixins: [ Navigation ]

  statics:
    pendingTransition: null

  handleSubmit: (e) ->
    e.preventDefault()

    result = {}
    allValid = true

    for ref in ['email', 'password']
      field = @refs[ref]
      field.validate()
      result[ref] = field.value()
      allValid = false unless field.isValid()

    if !allValid
      flash.alert 'Something went wrong!'
      return

    if _.isEqual(result, email: 'foo@bar.com', password: 'test123')
      auth.signIn()
      flash.next.notice 'Signed in successfully!'
      if (transition = SigninForm.pendingTransition)
        transition.retry()
        SigninForm.pendingTransition = null
      else
        @transitionTo('home')
    else
      flash.alert 'Something went wrong!'
      @refs.password.setError('invalid credentials!')

  getInitialState: ->
    invalidPassword: false

  render: ->
    <div>
      <div className="space--bottom-2">
        <h1 className="alpha">Sign in</h1>
      </div>
      <form
        className="form"
        onSubmit={@handleSubmit}
        noValidate
      >
        <InputField
          ref="email"
          label="Email"
          type="email"
          placeholder="Your email"
          validator={ nod(nod.checks.aString, checks.anEmail) }
        />
        <InputField
          ref="password"
          label="Password"
          type="password"
          placeholder="Your password"
          validator={ nod(nod.checks.aString, nod.checks.min(6)) }
        />
        <button type="submit" className="button--primary button--huge">
          Submit
        </button>
      </form>

      <p className="space--top-3">
        Psss.. use <em>foo@bar.com/test123</em> to enter!
      </p>
    </div>

module.exports = SigninForm

