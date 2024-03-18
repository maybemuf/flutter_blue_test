// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_blue_test/test/mocks/blue_repository.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:ui' as _i5;

import 'package:flutter_blue_plus/flutter_blue_plus.dart' as _i4;
import 'package:flutter_blue_test/features/blue/repositories/blue_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [BlueRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBlueRepository extends _i1.Mock implements _i2.BlueRepository {
  @override
  _i3.Stream<_i4.BluetoothAdapterState> get getAdapterState =>
      (super.noSuchMethod(
        Invocation.getter(#getAdapterState),
        returnValue: _i3.Stream<_i4.BluetoothAdapterState>.empty(),
        returnValueForMissingStub:
            _i3.Stream<_i4.BluetoothAdapterState>.empty(),
      ) as _i3.Stream<_i4.BluetoothAdapterState>);

  @override
  _i3.Stream<List<_i4.ScanResult>> get onScanResults => (super.noSuchMethod(
        Invocation.getter(#onScanResults),
        returnValue: _i3.Stream<List<_i4.ScanResult>>.empty(),
        returnValueForMissingStub: _i3.Stream<List<_i4.ScanResult>>.empty(),
      ) as _i3.Stream<List<_i4.ScanResult>>);

  @override
  _i3.Stream<bool> get isScanning => (super.noSuchMethod(
        Invocation.getter(#isScanning),
        returnValue: _i3.Stream<bool>.empty(),
        returnValueForMissingStub: _i3.Stream<bool>.empty(),
      ) as _i3.Stream<bool>);

  @override
  _i3.Future<void> startScanning() => (super.noSuchMethod(
        Invocation.method(
          #startScanning,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  void cancelWhenScanComplete(
          _i3.StreamSubscription<List<_i4.ScanResult>>? subscription) =>
      super.noSuchMethod(
        Invocation.method(
          #cancelWhenScanComplete,
          [subscription],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Future<void> stopScanning() => (super.noSuchMethod(
        Invocation.method(
          #stopScanning,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> connectToDevice(
    _i4.BluetoothDevice? device, {
    Duration? timeout = const Duration(seconds: 4),
    _i5.VoidCallback? onTimeout,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #connectToDevice,
          [device],
          {
            #timeout: timeout,
            #onTimeout: onTimeout,
          },
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> disconnectFromDevice(_i4.BluetoothDevice? device) =>
      (super.noSuchMethod(
        Invocation.method(
          #disconnectFromDevice,
          [device],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Stream<_i4.BluetoothConnectionState> getDeviceState(
          _i4.BluetoothDevice? device) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDeviceState,
          [device],
        ),
        returnValue: _i3.Stream<_i4.BluetoothConnectionState>.empty(),
        returnValueForMissingStub:
            _i3.Stream<_i4.BluetoothConnectionState>.empty(),
      ) as _i3.Stream<_i4.BluetoothConnectionState>);
}
