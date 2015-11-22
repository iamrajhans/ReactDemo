React = require('react/addons')
Router = require('react-router')
Route = Router.Route
Routes = Router.Routes
NotFoundRoute = Router.NotFoundRoute
DefaultRoute = Router.DefaultRoute

SigninForm = require('./signin_form')
App = require('./app')
Home = require('./home')
NotFound = require('./not_found')
Private = require('./private')
PrivateHome = require('./private_home')
flash = require('./flash')

resetFlash = -> flash.pageChanged()

router = (
  <Routes onChange={resetFlash} location="history">
    <Route name="home" path="/" handler={ App }>
      <DefaultRoute handler={ Home } />
      <Route name="sign-in" handler={ SigninForm } />
      <Route name="private" path="private" handler={ Private }>
        <DefaultRoute handler={ PrivateHome } />
      </Route>
    </Route>
    <NotFoundRoute handler={ NotFound } />
  </Routes>
)

React.render(router, document.getElementById('main'))

