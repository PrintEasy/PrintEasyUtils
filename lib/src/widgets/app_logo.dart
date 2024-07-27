import 'package:flutter/material.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.onTap,
    this.height,
    this.width,
    this.fit,
  });

  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) => TapHandler(
        onTap: onTap,
        radius: 0,
        child: Image.asset(
          AssetConstants.logo,
          fit: fit ?? BoxFit.cover,
          height: height ?? 40,
          width: width,
          package: PrintEasyConstants.appName,
        ),
      );
}
