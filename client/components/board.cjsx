_ = require 'lodash'
pads = require './pads'
Pad = require './pad'
React = require 'react'



Board = React.createClass
  playNote: ->
    return

  renderPads: ->
    _.map pads, (pad) ->
      console.log 'Pad', pad
      <Pad
        name={pad.name}
        key={pad.id}
        sample={pad.sample}
        />

  render: ->
    <div className="board">
      {@renderPads()}
    </div>

module.exports = Board
