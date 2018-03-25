import React, { Component } from 'react';
import { StackNavigator } from 'react-navigation';
import DisplayAnImage from './PictureViewer';


const RootStack = StackNavigator({
  Home: {
    screen: DisplayAnImage,
  },
});

export default class App extends React.Component {
  render() {
    return <RootStack />;
  }
}
