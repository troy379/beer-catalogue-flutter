import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  static const double cornerRadius = 12;

  final Widget child;
  final VoidCallback? onTap;

  const AppCard({
    required this.child,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: InkWell(
        borderRadius: BorderRadius.circular(cornerRadius),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
