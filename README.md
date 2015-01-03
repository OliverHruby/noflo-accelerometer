# noflo-sensors [![Build Status](https://api.travis-ci.org/oliverhruby/noflo-sensors.png?branch=master)](http://travis-ci.org/oliverhruby/noflo-sensors)

This library includes noflo components for various device sensors (mostly available in mobile devices).
These include orientation and motion sensors, gps, battery status, etc.
The intent is to build components which are reusable in nodejs, browser and also phonegap. 

## DeviceOrientation
Provides a listener to the deviceorientation event:

    DeviceOrientationEvent.absolute
    DeviceOrientationEvent.alpha
    DeviceOrientationEvent.beta
    DeviceOrientationEvent.gamma

## DeviceMotion
Provides access to the motion sensor on the device

![devicemotion](https://cloud.githubusercontent.com/assets/6117436/5603914/c5aa8982-939b-11e4-9ed2-3316d7691d6f.gif)
