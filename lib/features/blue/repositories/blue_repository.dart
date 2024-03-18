import 'dart:async';
import 'dart:ui';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

abstract interface class BlueRepository {
  Stream<BluetoothAdapterState> get getAdapterState;

  Stream<List<ScanResult>> get onScanResults;

  Stream<bool> get isScanning;

  Future<void> startScanning();

  void cancelWhenScanComplete(
    StreamSubscription<List<ScanResult>> subscription,
  );

  Future<void> stopScanning();

  Future<void> connectToDevice(
    BluetoothDevice device, {
    Duration timeout = const Duration(seconds: 4),
    VoidCallback? onTimeout,
  });

  Future<void> disconnectFromDevice(BluetoothDevice device);

  Stream<BluetoothConnectionState> getDeviceState(BluetoothDevice device);
}

class BlueRepositoryImpl implements BlueRepository {
  BlueRepositoryImpl();

  @override
  Future<void> connectToDevice(
    BluetoothDevice device, {
    Duration timeout = const Duration(seconds: 4),
    VoidCallback? onTimeout,
  }) async {
    try {
      await device.connect(timeout: timeout);
    } catch (e) {
      onTimeout?.call();
    }
  }

  @override
  Stream<BluetoothAdapterState> get getAdapterState {
    return FlutterBluePlus.adapterState;
  }

  @override
  Stream<bool> get isScanning {
    return FlutterBluePlus.isScanning;
  }

  @override
  Stream<List<ScanResult>> get onScanResults {
    return FlutterBluePlus.scanResults;
  }

  @override
  Future<void> startScanning() async {
    await FlutterBluePlus.startScan();
  }

  @override
  Future<void> stopScanning() async {
    await FlutterBluePlus.stopScan();
  }

  @override
  void cancelWhenScanComplete(
    StreamSubscription<List<ScanResult>> subscription,
  ) {
    FlutterBluePlus.cancelWhenScanComplete(subscription);
  }

  @override
  Stream<BluetoothConnectionState> getDeviceState(BluetoothDevice device) {
    return device.connectionState;
  }

  @override
  Future<void> disconnectFromDevice(BluetoothDevice device) async {
    await device.disconnect();
  }
}
