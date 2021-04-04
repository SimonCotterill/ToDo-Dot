import 'dart:core';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothStateHelper {
  static String bluetoothStateToString(BluetoothState state) {
    int stateValue = state.underlyingValue;

    // states from https://pub.dev/documentation/flutter_bluetooth_serial/latest/flutter_bluetooth_serial/BluetoothState-class.html
    switch (stateValue) {
      case -1: //ERROR
        return 'Error';
      case 15: //STATE_BLE_ON
      case 12: //STATE_ON
        return 'On';
      case 10: //STATE_OFF
        return 'Off';
      case 14: //STATE_BLE_TURNING_ON
      case 11: //STATE_TURNING_ON
        return 'Turning On';
      case 16: //STATE_BLE_TURNING_OFF
      case 13: //STATE_TURNING_OFF
        return 'Turning Off';
      case -2: //UNKNOWN
        return 'Unknown';
      default:
        return 'Error: Invalid State';
    }
  }
}
