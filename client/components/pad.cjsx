React = require 'react'
Howl = require('howler').Howl

SAMPLES = [{
  name : 'Kick',
  sampleUrl : './assets/samples/kick.wav'
},
{
  name : 'Bass',
  sampleUrl : './assets/samples/bass/bass.wav'
},
{
  name : 'Clap',
  sampleUrl : './assets/samples/clap.wav'
},
{
  name : 'Cymbal',
  sampleUrl : './assets/samples/cymbal.wav'
},

{
  name : 'Hi Hat',
  sampleUrl : './assets/samples/hi hat.wav'
},
{
  name : 'Snare',
  sampleUrl : './assets/samples/snare.wav'
},
{
  name : 'Tom',
  sampleUrl : './assets/samples/tom.wav'
}]

Pad = React.createClass
  setupSound: (event) ->
    console.log event, @props
    @props.sample = url : event.target.value

    return unless @props.sample
    @sound = new Howl {
      urls: [@props.sample.url],
      volume: 0.5,
      buffer: true,
      onload: =>
        padState = {}
        padState[@props.name] = @props.sample
        @props.onSave padState
    }

  componentDidMount: ->
    self = @
    @meshbluConnection = @props.meshbluConnection
    @meshbluConnection.on 'message', (message) =>
      console.log 'Message received', message
      console.log 'Properties', @props
      play = message.play || message.payload?.play
      if play == @props.name
        self.playNote()

  playNote: ->
    console.log 'Playing the sample', @props.sample
    @sound.play()

  renderEditMode: ->
    console.log 'SAMPLES', SAMPLES
    self = @
    samples = _.map SAMPLES, (sample) =>
      <option sample={sample.name} value={sample.sampleUrl}>{sample.name}</option>

    <div className="pad">
      <select onChange={self.setupSound}>
        {samples}
      </select>
    </div>


  renderTrigger: ->
    console.log 'Show Trigger'
    <div className="pad" onClick={@playNote}>{@props.name}</div>

  render: ->
    if @props.isEditing
      @renderEditMode()
    else
      @renderTrigger()

module.exports = Pad
