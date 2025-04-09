import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  const AppImage(
    this.imageUrl, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.scale = 1.0,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double scale;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.endsWith('.svg')) {
      return SvgPicture.network(
        imageUrl,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
      );
    }
    return Image.network(
      imageUrl,
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
      scale: scale,
    );
  }
}
