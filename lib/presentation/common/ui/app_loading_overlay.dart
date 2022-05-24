import 'package:flutter/material.dart';
import 'package:beer_catalogue_flutter/presentation/common/colors/app_colors.dart';

class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Container(
        color: AppColors.background.withOpacity(0.5),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent),
        ),
      ),
    );
  }
}
