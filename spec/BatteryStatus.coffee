noflo = require 'noflo'
unless noflo.isBrowser()
  chai = require 'chai' unless chai
  BatteryStatus = require '../components/BatteryStatus.coffee'
else
  BatteryStatus = require 'noflo-sensors/components/BatteryStatus.js'

describe 'BatteryStatus component', ->
  c = null
  start = null
  level = null
  charging = null
  beforeEach ->
    c = BatteryStatus.getComponent()
    start = noflo.internalSocket.createSocket()
    level = noflo.internalSocket.createSocket()
    charging = noflo.internalSocket.createSocket()
    c.inPorts.start.attach start
    c.outPorts.level.attach level
    c.outPorts.charging.attach charging

  describe 'when instantiated', ->
    it 'should have needed input ports', ->
      chai.expect(c.inPorts.start).to.be.an 'object'
    it 'should have needed output ports', ->
      chai.expect(c.outPorts.level).to.be.an 'object'
      chai.expect(c.outPorts.charging).to.be.an 'object'
    it 'should output the battery level', (done) ->
      level.once 'data', (res) ->
        chai.expect(res).to.equal 50
        done()
      start.send true
    it 'should output charging status', (done) ->
      charging.once 'data', (res) ->
        chai.expect(res).to.equal true
        done()
      start.send true
