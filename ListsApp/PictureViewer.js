import React, { Component } from 'react';
import { Button, View, Image } from 'react-native';

/*[require('./img/james_burke.jpeg'),
              require('./img/james_burke.jpeg'),
              require('./img/james_burke.jpeg')] */


const state = 0
const images ={1:require('./img/james_burke.jpeg'),
               2:require('./img/james_burke2.jpeg')}

export default class DisplayAnImage extends Component {
  constructor(props) {
  super(props);
  this.state = {num:1};
  }
  renderImage() {
    console.log(this.state.num)
    return (
       <Image
         style={{width: 250, height: 250}}
         source={images[this.state.num]}
       />
     );
   }

  render() {
    console.log(images)
    return (
      <View>
        {this.renderImage()}
        <Button
          onPress={() =>{this.setState({num: this.state.num + 1})}}
          title="Learn More"
          color="#841584"
          accessibilityLabel="Learn more about this purple button"
        />
      </View>
    );
  }
}
