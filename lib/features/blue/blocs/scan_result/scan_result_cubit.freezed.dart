// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_result_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScanResultState {
  BluetoothConnectionState get deviceState =>
      throw _privateConstructorUsedError;
  bool get isConnecting => throw _privateConstructorUsedError;
  List<BluetoothService> get services => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScanResultStateCopyWith<ScanResultState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanResultStateCopyWith<$Res> {
  factory $ScanResultStateCopyWith(
          ScanResultState value, $Res Function(ScanResultState) then) =
      _$ScanResultStateCopyWithImpl<$Res, ScanResultState>;
  @useResult
  $Res call(
      {BluetoothConnectionState deviceState,
      bool isConnecting,
      List<BluetoothService> services});
}

/// @nodoc
class _$ScanResultStateCopyWithImpl<$Res, $Val extends ScanResultState>
    implements $ScanResultStateCopyWith<$Res> {
  _$ScanResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceState = null,
    Object? isConnecting = null,
    Object? services = null,
  }) {
    return _then(_value.copyWith(
      deviceState: null == deviceState
          ? _value.deviceState
          : deviceState // ignore: cast_nullable_to_non_nullable
              as BluetoothConnectionState,
      isConnecting: null == isConnecting
          ? _value.isConnecting
          : isConnecting // ignore: cast_nullable_to_non_nullable
              as bool,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<BluetoothService>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScanResultStateImplCopyWith<$Res>
    implements $ScanResultStateCopyWith<$Res> {
  factory _$$ScanResultStateImplCopyWith(_$ScanResultStateImpl value,
          $Res Function(_$ScanResultStateImpl) then) =
      __$$ScanResultStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BluetoothConnectionState deviceState,
      bool isConnecting,
      List<BluetoothService> services});
}

/// @nodoc
class __$$ScanResultStateImplCopyWithImpl<$Res>
    extends _$ScanResultStateCopyWithImpl<$Res, _$ScanResultStateImpl>
    implements _$$ScanResultStateImplCopyWith<$Res> {
  __$$ScanResultStateImplCopyWithImpl(
      _$ScanResultStateImpl _value, $Res Function(_$ScanResultStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceState = null,
    Object? isConnecting = null,
    Object? services = null,
  }) {
    return _then(_$ScanResultStateImpl(
      deviceState: null == deviceState
          ? _value.deviceState
          : deviceState // ignore: cast_nullable_to_non_nullable
              as BluetoothConnectionState,
      isConnecting: null == isConnecting
          ? _value.isConnecting
          : isConnecting // ignore: cast_nullable_to_non_nullable
              as bool,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<BluetoothService>,
    ));
  }
}

/// @nodoc

class _$ScanResultStateImpl implements _ScanResultState {
  const _$ScanResultStateImpl(
      {this.deviceState = BluetoothConnectionState.disconnected,
      this.isConnecting = false,
      final List<BluetoothService> services = const <BluetoothService>[]})
      : _services = services;

  @override
  @JsonKey()
  final BluetoothConnectionState deviceState;
  @override
  @JsonKey()
  final bool isConnecting;
  final List<BluetoothService> _services;
  @override
  @JsonKey()
  List<BluetoothService> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  String toString() {
    return 'ScanResultState(deviceState: $deviceState, isConnecting: $isConnecting, services: $services)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanResultStateImpl &&
            (identical(other.deviceState, deviceState) ||
                other.deviceState == deviceState) &&
            (identical(other.isConnecting, isConnecting) ||
                other.isConnecting == isConnecting) &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceState, isConnecting,
      const DeepCollectionEquality().hash(_services));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanResultStateImplCopyWith<_$ScanResultStateImpl> get copyWith =>
      __$$ScanResultStateImplCopyWithImpl<_$ScanResultStateImpl>(
          this, _$identity);
}

abstract class _ScanResultState implements ScanResultState {
  const factory _ScanResultState(
      {final BluetoothConnectionState deviceState,
      final bool isConnecting,
      final List<BluetoothService> services}) = _$ScanResultStateImpl;

  @override
  BluetoothConnectionState get deviceState;
  @override
  bool get isConnecting;
  @override
  List<BluetoothService> get services;
  @override
  @JsonKey(ignore: true)
  _$$ScanResultStateImplCopyWith<_$ScanResultStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
