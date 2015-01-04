noflo = require 'noflo'
unless noflo.isBrowser()
  chai = require 'chai' unless chai
  DeviceOrientation = require '../components/DeviceOrientation.coffee'
else
  DeviceOrientation = require 'noflo-sensors/components/DeviceOrientation.js'

describe 'DeviceOrientation component', ->
  c = null
  start = null
  stop = null
  absolute = null
  alpha = null
  beta = null
  gamma = null
  removed = null
  beforeEach ->
    c = DeviceOrientation.getComponent()
    start = noflo.internalSocket.createSocket()
    stop = noflo.internalSocket.createSocket()
    absolute = noflo.internalSocket.createSocket()
    alpha = noflo.internalSocket.createSocket()
    beta = noflo.internalSocket.createSocket()
    gamma = noflo.internalSocket.createSocket()
    removed = noflo.internalSocket.createSocket()

  describe 'when instantiated', ->
    it 'should have needed input ports', ->
      chai.expect(c.inPorts.start).to.be.an 'object'
    it 'should have needed output ports', ->
      chai.expect(c.outPorts.absolute).to.be.an 'object'
      chai.expect(c.outPorts.alpha).to.be.an 'object'
      chai.expect(c.outPorts.beta).to.be.an 'object'
      chai.expect(c.outPorts.gamma).to.be.an 'object'
      chai.expect(c.outPorts.removed).to.be.an 'object'
    # it 'should output alpha', (done) ->
    #   alpha.once 'data', (res) ->
    #     chai.expect(res).to.equal 1
    #     done()
    #   start.send true
