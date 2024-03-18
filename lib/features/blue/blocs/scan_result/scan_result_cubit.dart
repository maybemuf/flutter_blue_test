import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_blue_test/features/blue/repositories/blue_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_result_state.dart';

part 'scan_result_cubit.freezed.dart';

class ScanResultCubit extends Cubit<ScanResultState> {
  final BlueRepository _blueRepository;

  ScanResultCubit(this._blueRepository) : super(const ScanResultState());

  StreamSubscription<BluetoothConnectionState>? _deviceStateSubscription;

  Future<void> init(BluetoothDevice device) async {
    _deviceStateSubscription =
        _blueRepository.getDeviceState(device).listen((deviceState) async {
      emit(state.copyWith(deviceState: deviceState, isConnecting: false));

      if (deviceState == BluetoothConnectionState.connected) {
        final services = await device.discoverServices();
        emit(state.copyWith(services: services));
      }
    });
  }

  Future<void> connectToDevice(
    BluetoothDevice device, {
    Duration timeout = const Duration(seconds: 4),
    VoidCallback? onTimeout,
  }) async {
    emit(state.copyWith(isConnecting: true));
    await _blueRepository.connectToDevice(
      device,
      timeout: timeout,
      onTimeout: onTimeout,
    );
  }

  Future<void> disconnectFromDevice(BluetoothDevice device) async {
    await _blueRepository.disconnectFromDevice(device);
  }

  Future<void> toggleConnection(
    BluetoothDevice device, {
    Duration timeout = const Duration(seconds: 4),
    VoidCallback? onTimeout,
  }) async {
    if (state.deviceState == BluetoothConnectionState.disconnected) {
      await connectToDevice(device, timeout: timeout, onTimeout: onTimeout);
    } else {
      await disconnectFromDevice(device);
    }
  }

  Future<void> cancelSubscriptions() async {
    await _deviceStateSubscription?.cancel();
  }

  @override
  Future<void> close() async {
    await cancelSubscriptions();
    return super.close();
  }
}
