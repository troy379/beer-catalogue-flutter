import 'dart:io';

import 'package:beer_catalogue_flutter/domain/models/beer.dart';
import 'package:beer_catalogue_flutter/domain/models/ingredient.dart';
import 'package:beer_catalogue_flutter/presentation/common/assets/app_assets.dart';
import 'package:beer_catalogue_flutter/presentation/common/colors/app_colors.dart';
import 'package:beer_catalogue_flutter/presentation/common/extensions/build_context_extensions.dart';
import 'package:beer_catalogue_flutter/presentation/common/ui/app_fade_in_network_image.dart';
import 'package:beer_catalogue_flutter/presentation/common/ui/app_favorite_check_box.dart';
import 'package:beer_catalogue_flutter/presentation/features/beer/details/bloc/beer_details_cubit.dart';
import 'package:beer_catalogue_flutter/presentation/features/beer/details/bloc/beer_details_state.dart';
import 'package:beer_catalogue_flutter/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeerDetailsScreen extends StatefulWidget {
  final Beer beer;

  const BeerDetailsScreen({
    required this.beer,
    Key? key,
  }) : super(key: key);

  @override
  State<BeerDetailsScreen> createState() => _BeerDetailsScreenState();
}

class _BeerDetailsScreenState extends State<BeerDetailsScreen> {
  late final _bloc = getIt<BeerDetailsCubit>(param1: widget.beer);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeerDetailsCubit, BeerDetailsState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.beer.name),
            centerTitle: Platform.isIOS,
            actions: [
              if (state.isFavorite != null) ...{
                AppFavoriteCheckBox(
                  isChecked: state.isFavorite!,
                  onPressed: _bloc.toggleCoinFavorite,
                ),
              },
              const SizedBox(width: 15),
            ],
          ),
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _ImageWidget(
                      beerId: state.beer.id,
                      imageUrl: state.beer.imageUrl,
                    ),
                    const SizedBox(height: 32),
                    _NameTextWidget(text: state.beer.name),
                    if (state.beer.tagline?.isNotEmpty == true) ...{
                      const SizedBox(height: 8),
                      _TaglineTextWidget(text: state.beer.tagline!),
                    },
                    if (state.beer.description?.isNotEmpty == true) ...{
                      const SizedBox(height: 34),
                      _TitleTextWidget(text: context.strings.beerDetailsDescription),
                      const SizedBox(height: 4),
                      _RegularTextWidget(text: state.beer.description!),
                    },
                    if (state.beer.brewersTips?.isNotEmpty == true) ...{
                      const SizedBox(height: 34),
                      _TitleTextWidget(text: context.strings.beerDetailsBrewersTips),
                      const SizedBox(height: 4),
                      _RegularTextWidget(text: state.beer.brewersTips!),
                    },
                    if (state.beer.suitableSnacks.isNotEmpty == true) ...{
                      const SizedBox(height: 34),
                      _TitleTextWidget(text: context.strings.beerDetailsSuitableSnacks),
                      const SizedBox(height: 4),
                      _RegularTextWidget(text: "• ${state.beer.suitableSnacks.join("\n• ")}"),
                    },
                    const SizedBox(height: 34),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _TitleTextWidget(text: context.strings.beerDetailsIngredients),
                        if (state.beer.ingredients.malt.isNotEmpty) ...{
                          const SizedBox(height: 16),
                          _IngredientsListWidget(
                            title: context.strings.beerDetailsIngredientsMalt,
                            ingredients: state.beer.ingredients.malt,
                          ),
                        },
                        if (state.beer.ingredients.hops.isNotEmpty) ...{
                          const SizedBox(height: 16),
                          _IngredientsListWidget(
                            title: context.strings.beerDetailsIngredientsHops,
                            ingredients: state.beer.ingredients.hops,
                          ),
                        },
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ImageWidget extends StatelessWidget {
  final String beerId;
  final String? imageUrl;

  const _ImageWidget({
    required this.beerId,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 2),
      child: Hero(
        tag: "${beerId}_image",
        child: AppFadeInNetworkImage(
          url: imageUrl,
          fit: BoxFit.contain,
          errorImage: Image.asset(AppAssets.icBottleEmpty),
        ),
      ),
    );
  }
}

class _NameTextWidget extends StatelessWidget {
  final String text;

  const _NameTextWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _TaglineTextWidget extends StatelessWidget {
  final String text;

  const _TaglineTextWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _TitleTextWidget extends StatelessWidget {
  final String text;

  const _TitleTextWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _RegularTextWidget extends StatelessWidget {
  final String text;

  const _RegularTextWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.textPrimary,
        height: 1.5,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

class _IngredientsListWidget extends StatelessWidget {
  final String title;
  final List<Ingredient> ingredients;

  const _IngredientsListWidget({
    required this.title,
    required this.ingredients,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        ...ingredients.map(
          (ingredient) => _IngredientWidget(ingredient: ingredient),
        ),
      ],
    );
  }
}

class _IngredientWidget extends StatelessWidget {
  final Ingredient ingredient;

  const _IngredientWidget({
    required this.ingredient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "• ${ingredient.name}",
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              height: 1.5,
            ),
          ),
          TextSpan(
            text: " (${ingredient.amount.value} ${ingredient.amount.unit})",
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
