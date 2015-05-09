React = require('react')
Router = require('react-router')
{ Redirect, Route, RouteHandler, Link, DefaultRoute, NotFoundRoute } = Router

App = require('./app')
Board = require('./components/board')


routes =
  <Route handler={App} path="/">
    <DefaultRoute handler={Board} />
  </Route>


Router.run routes, (Handler) ->
  React.render(<Handler/>, document.getElementById('app'))
