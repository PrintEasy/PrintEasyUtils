import 'package:flutter/material.dart';
import 'package:printeasy_utils/printeasy_utils.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({
    super.key,
    this.radius,
    this.height,
    this.width,
  });

  final double? radius;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 8),
        child: SizedBox(
          height: height,
          width: width,
          child: Shimmer.fromColors(
            baseColor: AppColors.onPrimary,
            highlightColor: AppColors.imageBackground,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
}

class TextShimmer extends StatelessWidget {
  const TextShimmer(
    this.text, {
    super.key,
    this.style,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: AppColors.onPrimary,
        highlightColor: AppColors.imageBackground,
        child: Text(
          text,
          style: style,
        ),
      );
}
