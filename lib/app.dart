import 'package:beer_catalogue_flutter/presentation/common/colors/app_colors.dart';
import 'package:beer_catalogue_flutter/presentation/features/beer/list/beers_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BeerCatalogueApp extends StatelessWidget {
  const BeerCatalogueApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Beer catalogue",
      localizationsDelegates: const [AppLocalizations.delegate],
      supportedLocales: const [
        Locale('en', ''),
      ],
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: AppColors.accent,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primary,
          secondary: AppColors.accent,
        ),
      ),
      home: const BeersListScreen(),
    );
  }
}
