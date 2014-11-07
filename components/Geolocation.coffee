noflo = require 'noflo'

class Geolocation extends noflo.Component
  description: 'Provides access to the GPS sensor on the device'
  icon: 'location-arrow'
  constructor: ->
    @inPorts =
      start: new noflo.Port 'bang'
      stop: new noflo.Port 'bang'
    @outPorts =
      latitude: new noflo.Port 'number'
      longitude: new noflo.Port 'number'
      accuracy: new noflo.Port 'number'
      
    foundLocation = (position) =>
      @outPorts.latitude.send position.coords.latitude
      @outPorts.longitude.send position.coords.longitude
      
    @inPorts.start.on 'data', =>
      navigator.geolocation.getCurrentPosition foundLocation
exports.getComponent = -> new Geolocation