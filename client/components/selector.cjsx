React = require 'react'
Samples = require './samples'

Selector = React.createClass
  componentWillMount: ->
    return

  componentDidMount: ->
    return

  render: ->
    <ul>
      <li>Selected: {@props.sample.name}</li>
    </ul>

module.exports = Selector
