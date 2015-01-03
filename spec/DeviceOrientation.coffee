noflo = require 'noflo'
unless noflo.isBrowser()
  chai = require 'chai' unless chai
  DeviceOrientation = require '../components/DeviceOrientation.coffee'
else
  DeviceOrientation = require 'noflo-sensors/components/DeviceOrientation.js'

describe 'DeviceOrientation component', ->
  c = null
  beforeEach ->
    c = DeviceOrientation.getComponent()

  describe 'when instantiated', ->
    it 'should have needed input ports', ->
      chai.expect(c.inPorts.start).to.be.an 'object'
    it 'should have needed output ports', ->
      chai.expect(c.outPorts.absolute).to.be.an 'object'
      chai.expect(c.outPorts.alpha).to.be.an 'object'
      chai.expect(c.outPorts.beta).to.be.an 'object'
      chai.expect(c.outPorts.gamma).to.be.an 'object'
      chai.expect(c.outPorts.removed).to.be.an 'object'
