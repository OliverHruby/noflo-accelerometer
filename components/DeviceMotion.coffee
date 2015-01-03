noflo = require 'noflo'

class DeviceMotion extends noflo.Component
  description: 'Provides access to the motion sensor on the device'
  icon: 'cube'
  constructor: ->
    @listening = false
    @inPorts =
      start: new noflo.Port 'bang'
      stop: new noflo.Port 'bang'
    @outPorts =
      x: new noflo.Port 'number'
      y: new noflo.Port 'number'
      z: new noflo.Port 'number'
      alpha: new noflo.Port 'number'
      beta: new noflo.Port 'number'
      gamma: new noflo.Port 'number'
      interval: new noflo.Port 'number'
      removed: new noflo.Port 'string'

    listener = (event) =>
      if event.acceleration is null and
      event.accelerationIncludingGravity is null and
      event.interval is null and
      event.rotationRate is null and
      @outPorts.removed.isAttached()
        @outPorts.removed.beginGroup event.key
        @outPorts.removed.send null
        @outPorts.removed.endGroup()
        return
      @outPorts.x.send event.accelerationIncludingGravity.x
      @outPorts.y.send event.accelerationIncludingGravity.y
      @outPorts.z.send event.accelerationIncludingGravity.z
      @outPorts.alpha.send event.rotationRate.alpha
      @outPorts.beta.send event.rotationRate.beta
      @outPorts.gamma.send event.rotationRate.gamma
      @outPorts.interval.send event.interval

    @inPorts.start.on 'data', =>
      return if @listening
      window.addEventListener 'devicemotion', listener, false
      @listening = true
    @inPorts.stop.on 'data', =>
      return unless @listening
      window.removeEventListener 'devicemotion', listener, false
      @listening = false
      @outPorts.x.disconnect()
      @outPorts.y.disconnect()
      @outPorts.z.disconnect()
      @outPorts.alpha.disconnect()
      @outPorts.beta.disconnect()
      @outPorts.gamma.disconnect()
      @outPorts.interval.disconnect()
      @outPorts.removed.disconnect()

exports.getComponent = -> new DeviceMotion