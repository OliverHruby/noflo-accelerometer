noflo = require 'noflo'

class DeviceOrientation extends noflo.Component
  description: 'Provides access to the orientation sensor on the device'
  icon: 'cube'
  constructor: ->
    @listening = false
    @inPorts =
      start: new noflo.Port 'bang'
      stop: new noflo.Port 'bang'
    @outPorts =
      absolute: new noflo.Port 'number'
      alpha: new noflo.Port 'number'
      beta: new noflo.Port 'number'
      gamma: new noflo.Port 'number'
      removed: new noflo.Port 'string'

    listener = (event) =>
      if event.absolute is null and event.alpha is null and event.beta is null and event.gama is null and @outPorts.removed.isAttached()
        @outPorts.removed.beginGroup event.key
        @outPorts.removed.send null
        @outPorts.removed.endGroup()
        return
      @outPorts.absolute.send event.absolute
      @outPorts.alpha.send event.alpha
      @outPorts.beta.send event.beta
      @outPorts.gamma.send event.gamma

    @inPorts.start.on 'data', =>
      return if @listening
      window.addEventListener 'deviceorientation', listener, false
      @listening = true
    @inPorts.stop.on 'data', =>
      return unless @listening
      window.removeEventListener 'deviceorientation', listener, false
      @listening = false
      @outPorts.absolute.disconnect()
      @outPorts.alpha.disconnect()
      @outPorts.beta.disconnect()
      @outPorts.gama.disconnect()
      @outPorts.removed.disconnect()

exports.getComponent = -> new DeviceOrientation