import { useEffect } from 'react';
import { StyleSheet, View, Text } from 'react-native';
import { setTextToWidget } from 'react-native-widget';

const sendTimeToWidget = (text: string) => {
  setTextToWidget(text)
    .then(() => {
      console.log('Time successfully sent to widget');
    })
    .catch((error: any) => {
      console.error('Failed to send time to widget:', error);
    });
};

export default function App() {
  const text = '지어니스트';
  useEffect(() => {
    sendTimeToWidget(text);
  }, []);

  return (
    <View style={styles.container}>
      <Text>text: {text}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
