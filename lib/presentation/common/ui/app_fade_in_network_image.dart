import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppFadeInNetworkImage extends StatelessWidget {
  final String? url;
  final BoxFit fit;
  final Widget? errorImage;

  const AppFadeInNetworkImage({
    required this.url,
    this.fit = BoxFit.cover,
    this.errorImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? "",
      fit: fit,
      errorWidget: (_, __, ___) => errorImage ?? const SizedBox(),
      fadeInDuration: const Duration(milliseconds: 200),
    );
  }
}
