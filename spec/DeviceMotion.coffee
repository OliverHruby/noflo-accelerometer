noflo = require 'noflo'
unless noflo.isBrowser()
  chai = require 'chai' unless chai
  DeviceMotion = require '../components/DeviceMotion.coffee'
else
  DeviceMotion = require 'noflo-sensors/components/DeviceMotion.js'

describe 'DeviceMotion component', ->
  c = null
  beforeEach ->
    c = DeviceMotion.getComponent()

  describe 'when instantiated', ->
    it 'should have needed input ports', ->
      chai.expect(c.inPorts.start).to.be.an 'object'
    it 'should have needed output ports', ->
      chai.expect(c.outPorts.x).to.be.an 'object'
      chai.expect(c.outPorts.y).to.be.an 'object'
      chai.expect(c.outPorts.z).to.be.an 'object'
      chai.expect(c.outPorts.alpha).to.be.an 'object'
      chai.expect(c.outPorts.beta).to.be.an 'object'
      chai.expect(c.outPorts.gamma).to.be.an 'object'
      chai.expect(c.outPorts.interval).to.be.an 'object'
      chai.expect(c.outPorts.removed).to.be.an 'object'
