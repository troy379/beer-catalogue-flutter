import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:beer_catalogue_flutter/domain/models/beer.dart';

part 'beers_list_state.freezed.dart';

@freezed
class BeersListState with _$BeersListState {
  const factory BeersListState({
    required List<Beer> beers,
    required Set<String> bookmarkedBeersIds,
    required int currentPage,
    required bool isAllBeersLoaded,
    required bool isLoading,
    required Exception? loadingException,
  }) = _BeersListState;

  factory BeersListState.initial() {
    return const BeersListState(
      beers: [],
      bookmarkedBeersIds: {},
      currentPage: 0,
      isAllBeersLoaded: false,
      isLoading: true,
      loadingException: null,
    );
  }
}
