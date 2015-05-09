React = require 'react'
Howl = require('howler').Howl

Pad = React.createClass
  componentWillMount: ->
    console.log @props.sample

    @sound = new Howl {
      urls: [@props.sample],
      volume: 0.5,
      buffer: true,
      onend: ->
        console.log 'Done!'

      onload: ->
        console.log 'Loaded'
    }

  componentDidMount: ->
    console.log 'BOOM!'

  playNote: ->
    console.log 'Playing the sample', @props.sample
    @sound.play()

  render: ->
    <div className="pad" onClick={@playNote}>{@props.name}</div>

module.exports = Pad
