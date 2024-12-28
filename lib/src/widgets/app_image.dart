import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage(
    this.imageUrl, {
    super.key,
    this.height,
    this.width,
    this.fit,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) => Image.network(
        imageUrl,
        fit: fit ?? BoxFit.cover,
        height: height,
        width: width,
      );
}
