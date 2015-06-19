_ = require 'lodash'
samples = require './samples'
Pad = require './pad'
React = require 'react'
Meshblu = require 'meshblu'
MessageSchema =
  type : 'object'
  properties :
    play :
      type : 'string',
      enum : ['Pad1', 'Pad2', 'Pad3', 'Pad4', 'Pad5', 'Pad6', 'Pad7', 'Pad8', 'Pad9']



Board = React.createClass
  getInitialState: ->
    isEditing: false

  componentWillMount: ->
    uuid = localStorage.deviceUUID || undefined
    token = localStorage.deviceToken || undefined

    @connection = Meshblu.createConnection
                    uuid : uuid
                    token : token

    @connection.on 'ready', (device) =>
      localStorage.deviceUUID = device.uuid
      localStorage.deviceToken = device.token

      @connection.update
        type : 'meshblu:drum-kit'
        messageSchema : MessageSchema

      @connection.device
        uuid: localStorage.deviceUUID
        token: localStorage.deviceToken
        (drumkit) =>

  saveStateForPad:(padState) ->
    @connection.update padState, (updatedDevice) =>

  playNote: ->
    return

  toggleEdit: ->
    @setState isEditing: !@state.isEditing

  renderPads: ->
    self = @
    _.map samples, (sample, index) ->
      # sample = sampleFromMeshblu || pad.sample
      <Pad
        sample={sample}
        isEditing={self.state.isEditing}
        onSave={self.saveStateForPad}
        meshbluConnection={self.connection}
        />

  renderEditLabel : ->
    editLabel =
      if @state.isEditing
        'Play'
      else
        'Edit'
    editLabel

  render: ->
    <div className="board-container">
      <img src="https://s3.amazonaws.com/octoblu-www/assets/images/octoblu-inverse.png" alt="Octoblu" className="board__logo" />
      <h1>808-Blu</h1>
      <a className="button" onClick={@toggleEdit}>{@renderEditLabel}</a>

      <div className="board">
        {@renderPads()}
      </div>
    </div>

module.exports = Board
