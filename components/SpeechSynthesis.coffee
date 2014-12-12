noflo = require 'noflo'

class SpeechSynthesis extends noflo.Component
  description: 'Provides text to speech functionality'
  icon: 'volume-up'
  constructor: ->
    @inPorts =
      text: new noflo.Port 'string'
      
    @inPorts.text.on 'data', =>
      msg = new SpeechSynthesisUtterance "test"
      window.speechSynthesis.speak msg
      
exports.getComponent = -> new SpeechSynthesis