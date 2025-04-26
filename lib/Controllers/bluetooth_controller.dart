import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BluetoothController extends ChangeNotifier {
  List<BluetoothDevice> devices = [];
  BluetoothConnection? connection;
  String? receivedMessage;

  Future<void> getDevices() async {
    try {
      devices = await FlutterBluetoothSerial.instance.getBondedDevices();
      notifyListeners();
    } catch (e) {
      log('!!!!!ERROR while getting devices:$e');
    }
  }

  Future<void> connectToDevice(BluetoothDevice? selectedDevice) async {
    try {
      connection = await BluetoothConnection.toAddress(selectedDevice!.address);
      log('Connected to: ${selectedDevice.name}');
      log(connection.toString());
      _setupDataReceivedListener();
      notifyListeners();
    } catch (e) {
      log(e.toString());
      log("connection failed!!!");
    }
  }

  Future<void> disconnect() async {
    log('disconnecting');
    if (connection != null) {
      try {
        await connection?.close();
        notifyListeners();
        log('disconnected!!!!!!!!!!!!!!');
        connection = null;
        log(connection.toString());
      } catch (e) {
        log(e.toString());
      }
    } else {
      log('connection was null');
    }
  }

  Future<void> sendData(String message) async {
    if (connection != null) {
      log('connection is not null!');

      try {
        // await _setupDataReceivedListener();
        connection!.output
            .add(Uint8List.fromList(message.codeUnits)); // Send data here

        await connection!.output.allSent; // Wait until all data is sent
        log('Data sent');
        log(message);
      } catch (e) {
        log(e.toString());
      }
    } else {
      log('Not connected to a device');
      log(connection.toString());
    }
  }

  Future<void> _setupDataReceivedListener() async {
    connection!.input!.listen((Uint8List data) {
      // Handle the received data here
      receivedMessage = String.fromCharCodes(data);
      // log(data.toString());
      log("Received data:$receivedMessage");
      notifyListeners();
      // You can process the received data as needed
    });
  }

  BluetoothController();
}

final bluetoothControllerProvider = ChangeNotifierProvider(
  (ref) => BluetoothController(),
);
