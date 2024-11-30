import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-widget' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const RNWidget = NativeModules.RNWidget
  ? NativeModules.RNWidget
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function multiply(a: number, b: number): Promise<number> {
  return RNWidget.multiply(a, b);
}

export function plus(a: number, b: number): Promise<number> {
  return RNWidget.plus(a, b);
}

export function getSystemVersion() {
  return RNWidget.getSystemVersion();
}

export function setTextToWidget(time: string) {
  return RNWidget.setTextToWidget(time)
    .then((response: any) => {
      console.log('Time sent to widget successfully:', time, response);
      return response;
    })
    .catch((error: any) => {
      console.error('Failed to send time to widget:', error);
      throw error;
    });
}
