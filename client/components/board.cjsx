_ = require 'lodash'
pads = require './pads'
Pad = require './pad'
React = require 'react'
meshblu = require 'meshblu'

meshblu_uuid = '4aad85a3-2a65-448c-86b7-ac8b4779e9ff'
meshblu_token = '040be06480430fdd3f8d2eea14ea9d0c18b9e8be'

Board = React.createClass
  getInitialState: =>
    isEditing: false

  componentWillMount: =>
    @conn = meshblu.createConnection({ uuid: meshblu_uuid, token: meshblu_token });
    @conn.onMessage (message) =>

  playNote: =>
    return

  toggleEdit: =>
    @setState isEditing: !@state.isEditing

  renderPads: =>
    self = @
    _.map pads, (pad) =>
      console.log 'Pad', pad
      <Pad
        name={pad.name}
        key={pad.id}
        sample={pad.sample}
        isEditing={self.state.isEditing}
        />

  render: =>
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
