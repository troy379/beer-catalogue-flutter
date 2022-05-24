// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beers_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeersListState {
  List<Beer> get beers => throw _privateConstructorUsedError;
  Set<String> get bookmarkedBeersIds => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get isAllBeersLoaded => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Exception? get loadingException => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeersListStateCopyWith<BeersListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeersListStateCopyWith<$Res> {
  factory $BeersListStateCopyWith(
          BeersListState value, $Res Function(BeersListState) then) =
      _$BeersListStateCopyWithImpl<$Res>;
  $Res call(
      {List<Beer> beers,
      Set<String> bookmarkedBeersIds,
      int currentPage,
      bool isAllBeersLoaded,
      bool isLoading,
      Exception? loadingException});
}

/// @nodoc
class _$BeersListStateCopyWithImpl<$Res>
    implements $BeersListStateCopyWith<$Res> {
  _$BeersListStateCopyWithImpl(this._value, this._then);

  final BeersListState _value;
  // ignore: unused_field
  final $Res Function(BeersListState) _then;

  @override
  $Res call({
    Object? beers = freezed,
    Object? bookmarkedBeersIds = freezed,
    Object? currentPage = freezed,
    Object? isAllBeersLoaded = freezed,
    Object? isLoading = freezed,
    Object? loadingException = freezed,
  }) {
    return _then(_value.copyWith(
      beers: beers == freezed
          ? _value.beers
          : beers // ignore: cast_nullable_to_non_nullable
              as List<Beer>,
      bookmarkedBeersIds: bookmarkedBeersIds == freezed
          ? _value.bookmarkedBeersIds
          : bookmarkedBeersIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isAllBeersLoaded: isAllBeersLoaded == freezed
          ? _value.isAllBeersLoaded
          : isAllBeersLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingException: loadingException == freezed
          ? _value.loadingException
          : loadingException // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc
abstract class _$$_BeersListStateCopyWith<$Res>
    implements $BeersListStateCopyWith<$Res> {
  factory _$$_BeersListStateCopyWith(
          _$_BeersListState value, $Res Function(_$_BeersListState) then) =
      __$$_BeersListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Beer> beers,
      Set<String> bookmarkedBeersIds,
      int currentPage,
      bool isAllBeersLoaded,
      bool isLoading,
      Exception? loadingException});
}

/// @nodoc
class __$$_BeersListStateCopyWithImpl<$Res>
    extends _$BeersListStateCopyWithImpl<$Res>
    implements _$$_BeersListStateCopyWith<$Res> {
  __$$_BeersListStateCopyWithImpl(
      _$_BeersListState _value, $Res Function(_$_BeersListState) _then)
      : super(_value, (v) => _then(v as _$_BeersListState));

  @override
  _$_BeersListState get _value => super._value as _$_BeersListState;

  @override
  $Res call({
    Object? beers = freezed,
    Object? bookmarkedBeersIds = freezed,
    Object? currentPage = freezed,
    Object? isAllBeersLoaded = freezed,
    Object? isLoading = freezed,
    Object? loadingException = freezed,
  }) {
    return _then(_$_BeersListState(
      beers: beers == freezed
          ? _value._beers
          : beers // ignore: cast_nullable_to_non_nullable
              as List<Beer>,
      bookmarkedBeersIds: bookmarkedBeersIds == freezed
          ? _value._bookmarkedBeersIds
          : bookmarkedBeersIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isAllBeersLoaded: isAllBeersLoaded == freezed
          ? _value.isAllBeersLoaded
          : isAllBeersLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingException: loadingException == freezed
          ? _value.loadingException
          : loadingException // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_BeersListState implements _BeersListState {
  const _$_BeersListState(
      {required final List<Beer> beers,
      required final Set<String> bookmarkedBeersIds,
      required this.currentPage,
      required this.isAllBeersLoaded,
      required this.isLoading,
      required this.loadingException})
      : _beers = beers,
        _bookmarkedBeersIds = bookmarkedBeersIds;

  final List<Beer> _beers;
  @override
  List<Beer> get beers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_beers);
  }

  final Set<String> _bookmarkedBeersIds;
  @override
  Set<String> get bookmarkedBeersIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_bookmarkedBeersIds);
  }

  @override
  final int currentPage;
  @override
  final bool isAllBeersLoaded;
  @override
  final bool isLoading;
  @override
  final Exception? loadingException;

  @override
  String toString() {
    return 'BeersListState(beers: $beers, bookmarkedBeersIds: $bookmarkedBeersIds, currentPage: $currentPage, isAllBeersLoaded: $isAllBeersLoaded, isLoading: $isLoading, loadingException: $loadingException)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeersListState &&
            const DeepCollectionEquality().equals(other._beers, _beers) &&
            const DeepCollectionEquality()
                .equals(other._bookmarkedBeersIds, _bookmarkedBeersIds) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.isAllBeersLoaded, isAllBeersLoaded) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.loadingException, loadingException));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_beers),
      const DeepCollectionEquality().hash(_bookmarkedBeersIds),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(isAllBeersLoaded),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(loadingException));

  @JsonKey(ignore: true)
  @override
  _$$_BeersListStateCopyWith<_$_BeersListState> get copyWith =>
      __$$_BeersListStateCopyWithImpl<_$_BeersListState>(this, _$identity);
}

abstract class _BeersListState implements BeersListState {
  const factory _BeersListState(
      {required final List<Beer> beers,
      required final Set<String> bookmarkedBeersIds,
      required final int currentPage,
      required final bool isAllBeersLoaded,
      required final bool isLoading,
      required final Exception? loadingException}) = _$_BeersListState;

  @override
  List<Beer> get beers => throw _privateConstructorUsedError;
  @override
  Set<String> get bookmarkedBeersIds => throw _privateConstructorUsedError;
  @override
  int get currentPage => throw _privateConstructorUsedError;
  @override
  bool get isAllBeersLoaded => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Exception? get loadingException => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BeersListStateCopyWith<_$_BeersListState> get copyWith =>
      throw _privateConstructorUsedError;
}
