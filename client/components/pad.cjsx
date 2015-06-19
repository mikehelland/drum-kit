React = require 'react'
Howl = require('howler').Howl
Selector = require './selector'
Trigger = require './trigger'

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
  name : 'Snare 2',
  sampleUrl : './assets/samples/snare (2).WAV'
},
{
  name : 'Tom',
  sampleUrl : './assets/samples/tom.wav'
},
{
  name : 'Tom 2',
  sampleUrl : './assets/samples/tom.wav'
},
]

Pad = React.createClass
  # setupSound: (event) ->
  #   @props.sample = url : event.target.value
  #
  #   return unless @props.sample
  #   @sound = new Howl {
  #     urls: [@props.sample.url],
  #     volume: 0.5,
  #     buffer: true,
  #     onload: =>
  #       padState = {}
  #       padState[@props.name] = @props.sample
  #       @props.onSave padState
  #   }
  #
  componentDidMount: ->
    return


  # onSampleSelection: (event) ->
  #   sample = event.target.value
  #
  # playNote: ->
  #   @sound.play()
  #
  # renderEditMode: ->
  #   self = @
  #   samples = _.map SAMPLES, (sample) =>
  #     <option sample={sample.name} value={sample}>{sample.name}</option>
  #
  #   <div className="pad">
  #     <select onChange={self.onSampleSelection}>
  #       {samples}
  #     </select>
  #   </div>

  componentWillMount: ->
    return

  renderTrigger: ->
    <div className="pad" onClick={@playNote}>{@props.name}</div>

  render: ->
    if @props.isEditing
      <Selector sample={@props.sample}></Selector>
    else
      <Trigger padId={@props.sample.id} sample={@props.sample} meshbluConnection={@props.meshbluConnection}></Trigger>

module.exports = Pad
