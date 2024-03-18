part of 'blue_cubit.dart';

@freezed
class BlueState with _$BlueState {
  const factory BlueState({
    @Default(BluetoothAdapterState.unknown) BluetoothAdapterState state,
    @Default(<ScanResult>[]) List<ScanResult> scanResults,
    @Default(false) bool isScanning,
  }) = _BlueState;
}
