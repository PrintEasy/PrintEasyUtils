import 'package:flutter/widgets.dart';

class TapHandler extends StatelessWidget {
  const TapHandler({
    super.key,
    this.onTap,
    this.radius,
    required this.child,
  });

  final VoidCallback? onTap;
  final Widget child;
  final double? radius;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 16),
        child: MouseRegion(
          cursor: onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
          child: GestureDetector(
          behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: child,
          ),
        ),
      );
}
