import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_blue_test/features/blue/blocs/scan_result/scan_result_cubit.dart';
import 'package:flutter_blue_test/features/blue/repositories/blue_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/blue_repository.mocks.dart';

void main() {
  late final BlueRepository blueRepository;
  late final ScanResultCubit scanResultCubit;

  setUpAll(() {
    blueRepository = MockBlueRepository();
    scanResultCubit = ScanResultCubit(blueRepository);
  });

  tearDown(() => scanResultCubit.cancelSubscriptions());

  test('should emit initial state', () {
    const initialState = ScanResultState();

    expect(scanResultCubit.state.deviceState, initialState.deviceState);
    expect(scanResultCubit.state.isConnecting, initialState.isConnecting);
    expect(scanResultCubit.state.services, initialState.services);
  });

  group('Device connection', () {
    final tDevice = BluetoothDevice(remoteId: const DeviceIdentifier('id'));
    test(
      'Should emit [BluetoothConnectionState.connected] when device '
      'is connected',
      () async {
        when(blueRepository.getDeviceState(tDevice)).thenAnswer(
          (_) => Stream.fromIterable([
            BluetoothConnectionState.disconnected,
            BluetoothConnectionState.connected,
          ]),
        );
        when(
          blueRepository.connectToDevice(
            tDevice,
            timeout: Duration.zero,
            onTimeout: anyNamed('onTimeout'),
          ),
        ).thenAnswer((_) async {});

        await scanResultCubit.init(tDevice);
        await scanResultCubit.connectToDevice(tDevice);

        expect(
          scanResultCubit.state.deviceState,
          BluetoothConnectionState.connected,
        );
      },
    );

    test(
      'Should emit [BluetoothConnectionState.disconnected] when device is'
      ' disconnected',
      () async {
        when(blueRepository.getDeviceState(tDevice)).thenAnswer(
          (_) => Stream.fromIterable([
            BluetoothConnectionState.connected,
            BluetoothConnectionState.disconnected,
          ]),
        );
        when(blueRepository.disconnectFromDevice(tDevice))
            .thenAnswer((_) async {});

        await scanResultCubit.init(tDevice);
        await scanResultCubit.disconnectFromDevice(tDevice);

        expect(
          scanResultCubit.state.deviceState,
          BluetoothConnectionState.disconnected,
        );
      },
    );
  });
}
