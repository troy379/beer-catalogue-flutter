import 'package:beer_catalogue_flutter/domain/use_cases/get_beers_list_use_case.dart';
import 'package:beer_catalogue_flutter/domain/use_cases/get_favorite_beer_ids_use_case.dart';
import 'package:beer_catalogue_flutter/presentation/features/beer/list/bloc/beers_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeersListCubit extends Cubit<BeersListState> {
  final GetBeersListUseCase _getBeersListUseCase;
  final GetFavoriteBeerIdsUseCase _getFavoriteBeerIdsUseCase;

  BeersListCubit({
    required GetBeersListUseCase getBeersListUseCase,
    required GetFavoriteBeerIdsUseCase getFavoriteBeerIdsUseCase,
  })  : _getBeersListUseCase = getBeersListUseCase,
        _getFavoriteBeerIdsUseCase = getFavoriteBeerIdsUseCase,
        super(BeersListState.initial()) {
    loadBeers();
    loadFavoriteBeerIds();
  }

  void loadBeers() async {
    if (state.isAllBeersLoaded) {
      return;
    }

    emit(state.copyWith(isLoading: true, loadingException: null));
    try {
      final pageToLoad = state.currentPage + 1;
      final beers = await _getBeersListUseCase.execute(page: pageToLoad);

      emit(
        state.copyWith(
          beers: state.beers + beers,
          currentPage: pageToLoad,
          isLoading: false,
          isAllBeersLoaded: beers.isEmpty,
        ),
      );
    } on Exception catch (exception) {
      emit(state.copyWith(isLoading: false, loadingException: exception));
    }
  }

  void loadFavoriteBeerIds() async {
    emit(
      state.copyWith(
        bookmarkedBeersIds: await _getFavoriteBeerIdsUseCase.execute(),
      ),
    );
  }
}
