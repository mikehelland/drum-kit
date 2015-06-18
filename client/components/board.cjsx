_ = require 'lodash'
pads = require './pads'
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

      console.log "Device", device
      @connection.update 
        type : 'meshblu:drum-kit'
        messageSchema : MessageSchema

      @connection.device
        uuid: localStorage.deviceUUID
        token: localStorage.deviceToken
        (drumkit) =>
          console.log "drumkit", drumkit.device




  saveStateForPad:(padState) ->
    @connection.update padState, (updatedDevice) =>
      console.log 'Updated Device', updatedDevice

  playNote: ->
    return

  toggleEdit: ->
    @setState isEditing: !@state.isEditing

  renderPads: ->
    self = @
    _.map pads, (pad) ->
      # sample = sampleFromMeshblu || pad.sample
      console.log 'Pad', pad
      <Pad
        name={pad.name}
        key={pad.id}
        sample={pad.sample}
        isEditing={self.state.isEditing}
        onSave={self.saveStateForPad}
        meshbluConnection={self.connection}
        />

  render: ->
    editLabel =
      if @state.isEditing
        'Play'
      else
        'Edit'

    <div className="board-container">
      <img src="https://s3.amazonaws.com/octoblu-www/assets/images/octoblu-inverse.png" alt="Octoblu" className="board__logo" />
      <h1>808-Blu</h1>
      <a className="button" onClick={@toggleEdit}>{editLabel}</a>

      <div className="board">
        {@renderPads()}
      </div>
    </div>

module.exports = Board
