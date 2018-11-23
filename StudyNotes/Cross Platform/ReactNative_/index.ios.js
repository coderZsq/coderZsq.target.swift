/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
} from 'react-native';

var BaseView = require('./js/baseview');
var LifeCycle = require('./js/lifecycle');
var ScrollView = require('./js/scrollview');

export default class ReactNative_ extends Component {
  render() {
    return (
        // <BaseView/>
        // <LifeCycle/>
        <ScrollView/>
    );
  }
}


AppRegistry.registerComponent('ReactNative_', () => ReactNative_);