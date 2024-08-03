import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage(
    this.imageUrl, {
    super.key,
    this.height,
    this.width,
    this.placeholderHeight,
    this.placeholderWidth,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final double? placeholderHeight;
  final double? placeholderWidth;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        height: height,
        width: width,
      );
}
