import 'package:beer_catalogue_flutter/domain/models/beer.dart';
import 'package:beer_catalogue_flutter/presentation/common/assets/app_assets.dart';
import 'package:beer_catalogue_flutter/presentation/common/colors/app_colors.dart';
import 'package:beer_catalogue_flutter/presentation/common/extensions/build_context_extensions.dart';
import 'package:beer_catalogue_flutter/presentation/common/ui/app_card.dart';
import 'package:beer_catalogue_flutter/presentation/common/ui/app_fade_in_network_image.dart';
import 'package:flutter/material.dart';

class BeerListItem extends StatelessWidget {
  final Beer beer;
  final bool isFavorite;
  final VoidCallback onPressed;

  const BeerListItem({
    required this.beer,
    required this.isFavorite,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onPressed,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _ImageWidget(
                  beerId: beer.id,
                  imageUrl: beer.imageUrl,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _NameWidget(name: beer.name),
                      if (beer.tagline?.isNotEmpty == true) ...{
                        _TaglineWidget(tagline: beer.tagline!),
                      },
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                _AbvValueWidget(abv: beer.abv),
              ],
            ),
          ),
          if (isFavorite) ...{
            const Align(
              alignment: Alignment.topRight,
              child: _BookmarkedBadgeWidget(),
            ),
          },
        ],
      ),
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
    return SizedBox(
      height: 100,
      width: 70,
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

class _NameWidget extends StatelessWidget {
  final String name;

  const _NameWidget({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _TaglineWidget extends StatelessWidget {
  final String tagline;

  const _TaglineWidget({
    required this.tagline,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      tagline,
      style: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _AbvValueWidget extends StatelessWidget {
  final double abv;

  const _AbvValueWidget({
    required this.abv,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          abv.toString(),
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          context.strings.abvLabel,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _BookmarkedBadgeWidget extends StatelessWidget {
  const _BookmarkedBadgeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(6),
        ),
      ),
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: const Icon(
        Icons.star_rounded,
        color: AppColors.background,
        size: 18,
      ),
    );
  }
}
