import 'package:beer_catalogue_flutter/domain/models/beer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_details_state.freezed.dart';

@freezed
class BeerDetailsState with _$BeerDetailsState {
  const factory BeerDetailsState({
    required Beer beer,
    required bool? isFavorite,
  }) = _BeerDetailsState;

  factory BeerDetailsState.initial({required final Beer beer}) {
    return BeerDetailsState(
      beer: beer,
      isFavorite: null,
    );
  }
}
