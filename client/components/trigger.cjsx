React = require 'react'
Samples = require './samples'
Howl = require('howler').Howl

Trigger = React.createClass
  componentWillMount: ->
    @sound = new Howl
      urls: [@props.sample.url],
      volume: 0.5,
      buffer: true
      onload: =>
        console.log 'Sample Loaded:', @props.sample.name

  playSample: ->
    @sound.play()

  componentDidMount: ->
    self = @
    @meshbluConnection = @props.meshbluConnection
    @meshbluConnection.on 'message', (message) =>
      play = message.play || message.payload?.play
      if play == @props.padId
        self.playSample()


  render: ->
    <button onClick={@playSample}>Trigger: {@props.sample.name}</button>

module.exports = Trigger
