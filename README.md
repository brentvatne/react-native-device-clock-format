# No Maintenance Intended

This project is no longer actively maintained. You probably should not use this library, it has not been tested by the author in two years and React Native has shed most of its old skin cells and become a new tool in that time. This library may not even work anymore. Unfortunately I do not know what to recommend as an alternative, if you do, please file an issue and I will update this README so people can find what they are looking for.

----------------------------------------------------------------------------------------------------------------

## react-native-device-clock-format

Determine whether the device is set to 12 or 24 hour time.

### Add it to your project

1. Run `npm install react-native-device-clock-format --save`
2. Open your project in XCode, right click on `Libraries` and click `Add Files to "Your Project Name"`
3. Add `libDeviceClockFormat.a` to `Build Phases -> Link Binary With Libraries`.
4. Whenever you want to use it within React code now you can: `var DeviceClockFormat = require('react-native-device-clock-format');`

### Example

```javascript
'use strict';

var React = require('react-native');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
} = React;

var DeviceClockFormat = require('react-native-device-clock-format');

var SampleApp = React.createClass({
  getInitialState() {
    return { format: 'Unknown..' }
  },

  componentWillMount() {
    this.fetchTimeFormat();
  },

  fetchTimeFormat() {
    DeviceClockFormat.fetch((twelveHour, twentyFourHour) => {
      if (twelveHour) {
        this.setState({format: '12 hour'});
      } else {
        this.setState({format: '24 hour'});
      }
    });
  },

  render: function() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          {this.state.format}
        </Text>
        <TouchableOpacity onPress={this.fetchTimeFormat}>
          <Text style={styles.instructions}>
            Update time format
          </Text>
        </TouchableOpacity>
      </View>
    );
  }
});

var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('SampleApp', () => SampleApp);
```
