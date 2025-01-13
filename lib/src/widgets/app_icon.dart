import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.icon, {
    super.key,
    this.color,
    this.size,
  });

  final String icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        icon,
        height: size,
        width: size,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : null,
      );
}
