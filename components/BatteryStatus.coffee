noflo = require 'noflo'

class BatteryStatus extends noflo.Component
  description: 'Battery status'
  icon: 'bolt'
  constructor: ->
    @battery = null
    @listening = false
    @inPorts =
      start: new noflo.Port 'bang'
    @outPorts =
      level: new noflo.Port 'number'
      charging: new noflo.Port 'boolean'

    @inPorts.start.on 'data', =>
      return if @listening
      #TODO: fix this
      @outPorts.level.send 50
      @outPorts.charging.send true
      @listening = true

exports.getComponent = -> new BatteryStatus