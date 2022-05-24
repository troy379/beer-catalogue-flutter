import 'package:beer_catalogue_flutter/domain/models/beer.dart';
import 'package:beer_catalogue_flutter/domain/use_cases/add_favorite_beer_id_use_case.dart';
import 'package:beer_catalogue_flutter/domain/use_cases/get_favorite_beer_ids_use_case.dart';
import 'package:beer_catalogue_flutter/domain/use_cases/remove_favorite_beer_id_use_case.dart';
import 'package:beer_catalogue_flutter/presentation/features/beer/details/bloc/beer_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeerDetailsCubit extends Cubit<BeerDetailsState> {
  final GetFavoriteBeerIdsUseCase _getFavoriteBeerIdsUseCase;
  final AddFavoriteBeerIdUseCase _addFavoriteBeerIdUseCase;
  final RemoveFavoriteBeerIdUseCase _removeFavoriteBeerIdUseCase;

  BeerDetailsCubit({
    required Beer beer,
    required GetFavoriteBeerIdsUseCase getFavoriteBeerIdsUseCase,
    required AddFavoriteBeerIdUseCase addFavoriteBeerIdUseCase,
    required RemoveFavoriteBeerIdUseCase removeFavoriteBeerIdUseCase,
  })  : _getFavoriteBeerIdsUseCase = getFavoriteBeerIdsUseCase,
        _addFavoriteBeerIdUseCase = addFavoriteBeerIdUseCase,
        _removeFavoriteBeerIdUseCase = removeFavoriteBeerIdUseCase,
        super(BeerDetailsState.initial(beer: beer)) {
    checkIsFavorite();
  }

  void checkIsFavorite() async {
    final favoriteIds = await _getFavoriteBeerIdsUseCase.execute();
    emit(
      state.copyWith(
        isFavorite: favoriteIds.contains(state.beer.id),
      ),
    );
  }

  void toggleCoinFavorite() {
    if (state.isFavorite == null) {
      return;
    }

    if (state.isFavorite!) {
      _removeFavoriteBeerIdUseCase.execute(beerId: state.beer.id);
    } else {
      _addFavoriteBeerIdUseCase.execute(beerId: state.beer.id);
    }
    emit(
      state.copyWith(isFavorite: !state.isFavorite!),
    );
  }
}
