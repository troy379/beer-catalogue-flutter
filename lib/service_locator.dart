import 'package:beer_catalogue_flutter/data/local/favorite_beer_local_storage.dart';
import 'package:beer_catalogue_flutter/data/network/punk_api_dio_client.dart';
import 'package:beer_catalogue_flutter/data/repositories/beer_repository_impl.dart';
import 'package:beer_catalogue_flutter/domain/models/beer.dart';
import 'package:beer_catalogue_flutter/domain/repositories/beer_repository.dart';
import 'package:beer_catalogue_flutter/domain/use_cases/add_favorite_beer_id_use_case.dart';
import 'package:beer_catalogue_flutter/domain/use_cases/get_beers_list_use_case.dart';
import 'package:beer_catalogue_flutter/domain/use_cases/get_favorite_beer_ids_use_case.dart';
import 'package:beer_catalogue_flutter/domain/use_cases/remove_favorite_beer_id_use_case.dart';
import 'package:beer_catalogue_flutter/presentation/features/beer/details/bloc/beer_details_cubit.dart';
import 'package:beer_catalogue_flutter/presentation/features/beer/list/bloc/beers_list_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

class AppServiceLocator {
  /// Initializes all dependencies declared inside the [AppServiceLocator].
  /// Should only be called before the [runApp] method
  static Future<void> initializeDependencies() async {
    await _initDioClients();
    await _initLocalStorages();
    await _initRepositories();
    await _initUseCases();
    await _initBlocs();
  }

  static Future<void> _initDioClients() async {
    getIt.registerLazySingleton<PunkApiDioClient>(
      () => PunkApiDioClient.create(),
    );
  }

  static Future<void> _initLocalStorages() async {
    getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance(),
    );
    getIt.registerFactory<FavoriteBeerLocalStorage>(
      () {
        return FavoriteBeerLocalStorage(
          sharedPreferences: getIt<SharedPreferences>(),
        );
      },
    );
  }

  static Future<void> _initRepositories() async {
    getIt.registerFactory<BeerRepository>(
      () {
        return BeerRepositoryImpl(
          dioClient: getIt<PunkApiDioClient>(),
          favoriteBeerLocalStorage: getIt<FavoriteBeerLocalStorage>(),
        );
      },
    );
  }

  static Future<void> _initUseCases() async {
    getIt.registerFactory<GetBeersListUseCase>(
      () {
        return GetBeersListUseCase(
          beerRepository: getIt<BeerRepository>(),
        );
      },
    );
    getIt.registerFactory<GetFavoriteBeerIdsUseCase>(
      () {
        return GetFavoriteBeerIdsUseCase(
          beerRepository: getIt<BeerRepository>(),
        );
      },
    );
    getIt.registerFactory<AddFavoriteBeerIdUseCase>(
      () {
        return AddFavoriteBeerIdUseCase(
          beerRepository: getIt<BeerRepository>(),
        );
      },
    );
    getIt.registerFactory<RemoveFavoriteBeerIdUseCase>(
      () {
        return RemoveFavoriteBeerIdUseCase(
          beerRepository: getIt<BeerRepository>(),
        );
      },
    );
  }

  static Future<void> _initBlocs() async {
    getIt.registerFactory<BeersListCubit>(
      () {
        return BeersListCubit(
          getBeersListUseCase: getIt<GetBeersListUseCase>(),
          getFavoriteBeerIdsUseCase: getIt<GetFavoriteBeerIdsUseCase>(),
        );
      },
    );
    getIt.registerFactoryParam<BeerDetailsCubit, Beer, void>(
      (beer, _) {
        return BeerDetailsCubit(
          beer: beer,
          getFavoriteBeerIdsUseCase: getIt<GetFavoriteBeerIdsUseCase>(),
          addFavoriteBeerIdUseCase: getIt<AddFavoriteBeerIdUseCase>(),
          removeFavoriteBeerIdUseCase: getIt<RemoveFavoriteBeerIdUseCase>(),
        );
      },
    );
  }
}
