import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

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
  Widget build(BuildContext context) => Opacity(
        opacity: o,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          height: height,
          width: width,
          // placeholder: (context, url) => DecoratedBox(
          //   decoration: BoxDecoration(
          //     color: AppColors.imageBackground.o,
          //     borderRadius: BorderRadius.circular(16),
          //   ),
          //   child: SizedBox(
          //     child: UnconstrainedBox(
          //       child: AppLogo(
          //         height: placeholderHeight,
          //         width: placeholderWidth,
          //       ),
          //     ),
          //   ),
          // ),
        ),
      );
}
