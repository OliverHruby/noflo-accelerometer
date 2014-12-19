noflo = require 'noflo'

class BatteryStatus extends noflo.Component
  description: 'Battery status'
  icon: 'bolt'
  constructor: ->
    @listening = false
    @inPorts =
      start: new noflo.Port 'bang'
    @outPorts =
      level: new noflo.Port 'number'

    listener = (event) =>
      @outPorts.level.send event.level

    @inPorts.start.on 'data', =>
      return if @listening
      navigator.getBattery.then (battery) ->
        battery.addEventListener 'levelchange', listener, false
      @listening = true

exports.getComponent = -> new BatteryStatus