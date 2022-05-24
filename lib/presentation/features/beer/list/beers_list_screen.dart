import 'package:beer_catalogue_flutter/domain/models/beer.dart';
import 'package:beer_catalogue_flutter/presentation/common/colors/app_colors.dart';
import 'package:beer_catalogue_flutter/presentation/common/extensions/build_context_extensions.dart';
import 'package:beer_catalogue_flutter/presentation/common/ui/app_paginated_list.dart';
import 'package:beer_catalogue_flutter/presentation/features/beer/details/beer_details_screen.dart';
import 'package:beer_catalogue_flutter/presentation/features/beer/list/bloc/beers_list_cubit.dart';
import 'package:beer_catalogue_flutter/presentation/features/beer/list/bloc/beers_list_state.dart';
import 'package:beer_catalogue_flutter/presentation/features/beer/list/ui/beer_list_item.dart';
import 'package:beer_catalogue_flutter/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeersListScreen extends StatefulWidget {
  const BeersListScreen({Key? key}) : super(key: key);

  @override
  State<BeersListScreen> createState() => _BeersListScreenState();
}

class _BeersListScreenState extends State<BeersListScreen> {
  late final _bloc = getIt<BeersListCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeersListCubit, BeersListState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(context.strings.beersListTitle)),
          backgroundColor: AppColors.background,
          body: AppPaginatedList(
            items: state.beers,
            isLoading: state.isLoading,
            loadingException: state.loadingException,
            onLoadItems: _bloc.loadBeers,
            itemsBuilder: (context, index) {
              final beer = state.beers[index];
              return BeerListItem(
                beer: beer,
                isFavorite: state.bookmarkedBeersIds.contains(beer.id),
                onPressed: () => _openBeerDetails(beer: beer),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _openBeerDetails({required final Beer beer}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BeerDetailsScreen(beer: beer),
      ),
    );

    _bloc.loadFavoriteBeerIds();
  }
}
