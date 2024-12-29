import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    this.mobileSmall,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.desktopLarge,
  });

  final Widget? mobileSmall;
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? desktopLarge;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          var type = LayoutType.fromWidth(Get.width);
          return switch (type) {
            LayoutType.mobileSmall => mobileSmall ?? mobile,
            LayoutType.mobile => mobile,
            LayoutType.tablet => tablet ?? mobile,
            LayoutType.desktop => desktop ?? tablet ?? mobile,
            LayoutType.desktopLarge => desktopLarge ?? desktop ?? tablet ?? mobile,
          };
        },
      );
}
