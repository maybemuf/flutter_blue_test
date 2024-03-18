import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_blue_test/features/blue/repositories/blue_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'blue_state.dart';

part 'blue_cubit.freezed.dart';

class BlueCubit extends Cubit<BlueState> {
  final BlueRepository _blueRepository;

  BlueCubit(this._blueRepository) : super(const BlueState());

  StreamSubscription<BluetoothAdapterState>?
  _adapterStateSubscription;
  StreamSubscription<List<ScanResult>>? _scanResultsSubscription;
  StreamSubscription<bool>? _isScanningSubscription;

  Future<void> init() async {
    _adapterStateSubscription =
        _blueRepository.getAdapterState.listen((adapterState) {
          emit(state.copyWith(state: adapterState));
        });
    _scanResultsSubscription =
        _blueRepository.onScanResults.distinctUnique().listen((results) {
          emit(state.copyWith(scanResults: results));
        });
    _isScanningSubscription = _blueRepository.isScanning.listen((isScanning) {
      emit(state.copyWith(isScanning: isScanning));
    });
  }

  Future<void> toggleScanning() async {
    if (state.isScanning) {
      await _blueRepository.stopScanning();
    } else {
      await _blueRepository.startScanning();
    }
  }

  Future<void> cancelSubscriptions() async {
    await _adapterStateSubscription?.cancel();
    await _scanResultsSubscription?.cancel();
    await _isScanningSubscription?.cancel();
  }

  @override
  Future<void> close() async {
    await cancelSubscriptions();
    return super.close();
  }
}