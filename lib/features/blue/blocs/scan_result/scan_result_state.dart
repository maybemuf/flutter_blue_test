part of 'scan_result_cubit.dart';

@freezed
class ScanResultState with _$ScanResultState {
  const factory ScanResultState({
    @Default(BluetoothConnectionState.disconnected)
    BluetoothConnectionState deviceState,
    @Default(false) bool isConnecting,
    @Default(<BluetoothService>[]) List<BluetoothService> services,
  }) = _ScanResultState;
}
