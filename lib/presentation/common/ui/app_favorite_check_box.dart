import 'package:beer_catalogue_flutter/presentation/common/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppFavoriteCheckBox extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onPressed;
  final double size;

  const AppFavoriteCheckBox({
    required this.isChecked,
    required this.onPressed,
    this.size = 26,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPressed,
      radius: size,
      child: Icon(
        isChecked ? Icons.star_rounded : Icons.star_border_rounded,
        color: AppColors.background,
        size: size,
      ),
    );
  }
}
