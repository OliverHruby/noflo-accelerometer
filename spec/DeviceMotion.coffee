noflo = require 'noflo'
unless noflo.isBrowser()
  chai = require 'chai' unless chai
  DeviceMotion = require '../components/DeviceMotion.coffee'
else
  DeviceMotion = require 'noflo-sensors/components/DeviceMotion.js'

describe 'DeviceMotion component', ->
  c = null
  start = null
  stop = null
  x = null
  y = null
  z = null
  alpha = null
  beta = null
  gamma = null
  interval = null
  removed = null
  beforeEach ->
    c = DeviceMotion.getComponent()
    start = noflo.internalSocket.createSocket()
    stop = noflo.internalSocket.createSocket()
    x = noflo.internalSocket.createSocket()
    y = noflo.internalSocket.createSocket()
    z = noflo.internalSocket.createSocket()
    alpha = noflo.internalSocket.createSocket()
    beta = noflo.internalSocket.createSocket()
    gamma = noflo.internalSocket.createSocket()
    interval = noflo.internalSocket.createSocket()
    removed = noflo.internalSocket.createSocket()

  describe 'when instantiated', ->
    it 'should have needed input ports', ->
      chai.expect(c.inPorts.start).to.be.an 'object'
      chai.expect(c.inPorts.stop).to.be.an 'object'
    it 'should have needed output ports', ->
      chai.expect(c.outPorts.x).to.be.an 'object'
      chai.expect(c.outPorts.y).to.be.an 'object'
      chai.expect(c.outPorts.z).to.be.an 'object'
      chai.expect(c.outPorts.alpha).to.be.an 'object'
      chai.expect(c.outPorts.beta).to.be.an 'object'
      chai.expect(c.outPorts.gamma).to.be.an 'object'
      chai.expect(c.outPorts.interval).to.be.an 'object'
      chai.expect(c.outPorts.removed).to.be.an 'object'
    # it 'should output the x value', (done) ->
    #   x.once 'data', (res) ->
    #     chai.expect(res).to.equal 1
    #     done()
    #   start.send true
