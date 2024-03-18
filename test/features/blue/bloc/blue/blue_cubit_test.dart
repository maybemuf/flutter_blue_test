import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_blue_test/features/blue/blocs/blue/blue_cubit.dart';
import 'package:flutter_blue_test/features/blue/repositories/blue_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/blue_repository.mocks.dart';

void main() {
  late final BlueRepository blueRepository;
  late final BlueCubit blueCubit;

  setUpAll(() {
    blueRepository = MockBlueRepository();
    blueCubit = BlueCubit(blueRepository);
  });

  tearDown(() => blueCubit.cancelSubscriptions());

  group('cubit initialization', () {
    test('should emit initial state', () {
      const initialState = BlueState();

      expect(blueCubit.state.state, initialState.state);
      expect(blueCubit.state.scanResults, initialState.scanResults);
      expect(blueCubit.state.isScanning, initialState.isScanning);
    });

    test(
      'should emit [BluetoothAdapterState.on] when device is connected to '
      'a bluetooth',
      () async {
        when(blueRepository.getAdapterState).thenAnswer(
          (_) => Stream.fromIterable([BluetoothAdapterState.on]),
        );
        await blueCubit.init();
        expect(blueCubit.state.state, BluetoothAdapterState.on);
      },
    );

    test(
      'should emit [BluetoothAdapterState.off] when device is not connected '
      'to a bluetooth',
      () async {
        when(blueRepository.getAdapterState).thenAnswer(
          (_) => Stream.fromIterable([BluetoothAdapterState.off]),
        );
        await blueCubit.init();
        expect(blueCubit.state.state, BluetoothAdapterState.off);
      },
    );
  });

  group('Device scanning', () {
    final tScanResult = ScanResult(
      timeStamp: DateTime.now(),
      device: BluetoothDevice(remoteId: const DeviceIdentifier('id')),
      rssi: -50,
      advertisementData: AdvertisementData(
        serviceUuids: [],
        manufacturerData: {},
        serviceData: {},
        txPowerLevel: 0,
        connectable: false,
        advName: 'device',
        appearance: null,
      ),
    );

    test('should start scanning for devices', () async {
      when(blueRepository.isScanning)
          .thenAnswer((_) => Stream.fromIterable([false, true]));
      await blueCubit.init();
      await blueCubit.toggleScanning();
      verify(blueRepository.startScanning()).called(1);
      expect(blueCubit.state.isScanning, true);
    });

    test('should stop scanning after start', () async {
      when(blueRepository.isScanning)
          .thenAnswer((_) => Stream.fromIterable([false, true, false]));
      await blueCubit.init();
      await blueCubit.toggleScanning();
      await blueCubit.toggleScanning();
      verify(blueRepository.stopScanning()).called(1);
      expect(blueCubit.state.isScanning, false);
    });

    test('Should find scan results', () async {
      final scanResults = [tScanResult, tScanResult];
      when(blueRepository.onScanResults).thenAnswer(
        (_) => Stream.fromIterable([scanResults]),
      );
      await blueCubit.init();
      await blueCubit.toggleScanning();
      expect(blueCubit.state.scanResults, scanResults);
    });
  });
}
