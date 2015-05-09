_ = require 'lodash'
pads = require './pads'
Pad = require './pad'
React = require 'react'



Board = React.createClass
  getInitialState: ->
    isEditing: false

  playNote: ->
    return

  toggleEdit: ->
    @setState isEditing: !@state.isEditing

  renderPads: ->
    self = @
    _.map pads, (pad) ->
      console.log 'Pad', pad
      <Pad
        name={pad.name}
        key={pad.id}
        sample={pad.sample}
        isEditing={self.state.isEditing}
        />

  render: ->
    editLabel =
      if @state.isEditing
        'Play'
      else
        'Edit'

    <div className="board-container">
      <button onClick={@toggleEdit}>{editLabel}</button>

      <div className="board">
        {@renderPads()}
      </div>
    </div>

module.exports = Board
