import React, { Component } from 'react';
import { Button, View, Image } from 'react-native';


var images = ["{require('./img/james_burke.jpeg')}",
              "{require('./img/james_burke.jpeg')}",
              "{require('./img/james_burke.jpeg')}"]

const state = 0
console.log(images[0]);

export default class DisplayAnImage extends Component {
  render() {
    return (
      <View>
        <Image
          style={{width: 250, height: 250}}
          source={require('./img/james_burke.jpeg')}
        />
        <Button
          onPress={() => {alert("it works");}}
          title="Learn More"
          color="#841584"
          accessibilityLabel="Learn more about this purple button"
        />
      </View>
    );
  }
}
