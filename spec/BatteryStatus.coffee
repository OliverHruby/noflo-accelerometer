noflo = require 'noflo'
unless noflo.isBrowser()
  chai = require 'chai' unless chai
  BatteryStatus = require '../components/BatteryStatus.coffee'
else
  BatteryStatus = require 'noflo-sensors/components/BatteryStatus.js'

describe 'BatteryStatus component', ->
  c = null
  beforeEach ->
    c = BatteryStatus.getComponent()

  describe 'when instantiated', ->
    it 'should have needed input ports', ->
      chai.expect(c.inPorts.start).to.be.an 'object'
    it 'should have needed output ports', ->
      chai.expect(c.outPorts.level).to.be.an 'object'
      chai.expect(c.outPorts.charging).to.be.an 'object'
