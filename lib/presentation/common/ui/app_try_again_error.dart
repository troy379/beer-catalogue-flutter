import 'package:flutter/material.dart';
import 'package:beer_catalogue_flutter/presentation/common/colors/app_colors.dart';
import 'package:beer_catalogue_flutter/presentation/common/extensions/build_context_extensions.dart';

class AppSimpleTryAgainError extends StatelessWidget {
  final String message;
  final VoidCallback onTryAgain;

  const AppSimpleTryAgainError({
    required this.message,
    required this.onTryAgain,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _MessageText(message: message),
          const SizedBox(height: 16),
          _ActionButton(
            label: context.strings.tryAgain,
            onTryAgain: onTryAgain,
          ),
        ],
      ),
    );
  }
}

class _MessageText extends StatelessWidget {
  final String message;

  const _MessageText({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
        color: AppColors.textPrimary,
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTryAgain;

  const _ActionButton({
    required this.label,
    required this.onTryAgain,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColors.primary,
        elevation: 0,
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onTryAgain,
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          letterSpacing: 1.1,
        ),
      ),
    );
  }
}
