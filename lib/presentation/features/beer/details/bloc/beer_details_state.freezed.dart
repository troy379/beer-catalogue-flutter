// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeerDetailsState {
  Beer get beer => throw _privateConstructorUsedError;
  bool? get isFavorite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeerDetailsStateCopyWith<BeerDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerDetailsStateCopyWith<$Res> {
  factory $BeerDetailsStateCopyWith(
          BeerDetailsState value, $Res Function(BeerDetailsState) then) =
      _$BeerDetailsStateCopyWithImpl<$Res>;
  $Res call({Beer beer, bool? isFavorite});
}

/// @nodoc
class _$BeerDetailsStateCopyWithImpl<$Res>
    implements $BeerDetailsStateCopyWith<$Res> {
  _$BeerDetailsStateCopyWithImpl(this._value, this._then);

  final BeerDetailsState _value;
  // ignore: unused_field
  final $Res Function(BeerDetailsState) _then;

  @override
  $Res call({
    Object? beer = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      beer: beer == freezed
          ? _value.beer
          : beer // ignore: cast_nullable_to_non_nullable
              as Beer,
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_BeerDetailsStateCopyWith<$Res>
    implements $BeerDetailsStateCopyWith<$Res> {
  factory _$$_BeerDetailsStateCopyWith(
          _$_BeerDetailsState value, $Res Function(_$_BeerDetailsState) then) =
      __$$_BeerDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call({Beer beer, bool? isFavorite});
}

/// @nodoc
class __$$_BeerDetailsStateCopyWithImpl<$Res>
    extends _$BeerDetailsStateCopyWithImpl<$Res>
    implements _$$_BeerDetailsStateCopyWith<$Res> {
  __$$_BeerDetailsStateCopyWithImpl(
      _$_BeerDetailsState _value, $Res Function(_$_BeerDetailsState) _then)
      : super(_value, (v) => _then(v as _$_BeerDetailsState));

  @override
  _$_BeerDetailsState get _value => super._value as _$_BeerDetailsState;

  @override
  $Res call({
    Object? beer = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_$_BeerDetailsState(
      beer: beer == freezed
          ? _value.beer
          : beer // ignore: cast_nullable_to_non_nullable
              as Beer,
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_BeerDetailsState implements _BeerDetailsState {
  const _$_BeerDetailsState({required this.beer, required this.isFavorite});

  @override
  final Beer beer;
  @override
  final bool? isFavorite;

  @override
  String toString() {
    return 'BeerDetailsState(beer: $beer, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeerDetailsState &&
            const DeepCollectionEquality().equals(other.beer, beer) &&
            const DeepCollectionEquality()
                .equals(other.isFavorite, isFavorite));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(beer),
      const DeepCollectionEquality().hash(isFavorite));

  @JsonKey(ignore: true)
  @override
  _$$_BeerDetailsStateCopyWith<_$_BeerDetailsState> get copyWith =>
      __$$_BeerDetailsStateCopyWithImpl<_$_BeerDetailsState>(this, _$identity);
}

abstract class _BeerDetailsState implements BeerDetailsState {
  const factory _BeerDetailsState(
      {required final Beer beer,
      required final bool? isFavorite}) = _$_BeerDetailsState;

  @override
  Beer get beer => throw _privateConstructorUsedError;
  @override
  bool? get isFavorite => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BeerDetailsStateCopyWith<_$_BeerDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
