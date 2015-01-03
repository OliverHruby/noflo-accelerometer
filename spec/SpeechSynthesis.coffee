noflo = require 'noflo'
unless noflo.isBrowser()
  chai = require 'chai' unless chai
  SpeechSynthesis = require '../components/SpeechSynthesis.coffee'
else
  SpeechSynthesis = require 'noflo-sensors/components/SpeechSynthesis.js'

describe 'SpeechSynthesis component', ->
  c = null
  beforeEach ->
    c = SpeechSynthesis.getComponent()

  describe 'when instantiated', ->
    it 'should have needed input ports', ->
      chai.expect(c.inPorts.text).to.be.an 'object'
      