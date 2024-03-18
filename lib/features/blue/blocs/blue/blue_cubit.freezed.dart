// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blue_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BlueState {
  BluetoothAdapterState get state => throw _privateConstructorUsedError;
  List<ScanResult> get scanResults => throw _privateConstructorUsedError;
  bool get isScanning => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlueStateCopyWith<BlueState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlueStateCopyWith<$Res> {
  factory $BlueStateCopyWith(BlueState value, $Res Function(BlueState) then) =
      _$BlueStateCopyWithImpl<$Res, BlueState>;
  @useResult
  $Res call(
      {BluetoothAdapterState state,
      List<ScanResult> scanResults,
      bool isScanning});
}

/// @nodoc
class _$BlueStateCopyWithImpl<$Res, $Val extends BlueState>
    implements $BlueStateCopyWith<$Res> {
  _$BlueStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? scanResults = null,
    Object? isScanning = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as BluetoothAdapterState,
      scanResults: null == scanResults
          ? _value.scanResults
          : scanResults // ignore: cast_nullable_to_non_nullable
              as List<ScanResult>,
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlueStateImplCopyWith<$Res>
    implements $BlueStateCopyWith<$Res> {
  factory _$$BlueStateImplCopyWith(
          _$BlueStateImpl value, $Res Function(_$BlueStateImpl) then) =
      __$$BlueStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BluetoothAdapterState state,
      List<ScanResult> scanResults,
      bool isScanning});
}

/// @nodoc
class __$$BlueStateImplCopyWithImpl<$Res>
    extends _$BlueStateCopyWithImpl<$Res, _$BlueStateImpl>
    implements _$$BlueStateImplCopyWith<$Res> {
  __$$BlueStateImplCopyWithImpl(
      _$BlueStateImpl _value, $Res Function(_$BlueStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? scanResults = null,
    Object? isScanning = null,
  }) {
    return _then(_$BlueStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as BluetoothAdapterState,
      scanResults: null == scanResults
          ? _value._scanResults
          : scanResults // ignore: cast_nullable_to_non_nullable
              as List<ScanResult>,
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BlueStateImpl implements _BlueState {
  const _$BlueStateImpl(
      {this.state = BluetoothAdapterState.unknown,
      final List<ScanResult> scanResults = const <ScanResult>[],
      this.isScanning = false})
      : _scanResults = scanResults;

  @override
  @JsonKey()
  final BluetoothAdapterState state;
  final List<ScanResult> _scanResults;
  @override
  @JsonKey()
  List<ScanResult> get scanResults {
    if (_scanResults is EqualUnmodifiableListView) return _scanResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scanResults);
  }

  @override
  @JsonKey()
  final bool isScanning;

  @override
  String toString() {
    return 'BlueState(state: $state, scanResults: $scanResults, isScanning: $isScanning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlueStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality()
                .equals(other._scanResults, _scanResults) &&
            (identical(other.isScanning, isScanning) ||
                other.isScanning == isScanning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state,
      const DeepCollectionEquality().hash(_scanResults), isScanning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlueStateImplCopyWith<_$BlueStateImpl> get copyWith =>
      __$$BlueStateImplCopyWithImpl<_$BlueStateImpl>(this, _$identity);
}

abstract class _BlueState implements BlueState {
  const factory _BlueState(
      {final BluetoothAdapterState state,
      final List<ScanResult> scanResults,
      final bool isScanning}) = _$BlueStateImpl;

  @override
  BluetoothAdapterState get state;
  @override
  List<ScanResult> get scanResults;
  @override
  bool get isScanning;
  @override
  @JsonKey(ignore: true)
  _$$BlueStateImplCopyWith<_$BlueStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
