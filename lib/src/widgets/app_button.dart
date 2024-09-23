import 'package:flutter/material.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    required this.label,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.icon,
    this.position = IconPosition.leading,
  })  : _isSmall = false,
        height = 48;

  const AppButton.small({
    super.key,
    required this.onTap,
    required this.label,
    this.foregroundColor,
    this.backgroundColor,
    this.borderColor,
    this.icon,
    this.position = IconPosition.leading,
  })  : _isSmall = true,
        height = 40;

  final VoidCallback? onTap;
  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final IconData? icon;
  final IconPosition position;

  final bool _isSmall;
  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: _isSmall ? null : double.maxFinite,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.primary,
            foregroundColor: foregroundColor ?? AppColors.white,
            textStyle: context.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            shape: StadiumBorder(
              side: BorderSide(
                width: 1,
                color: borderColor ?? backgroundColor ?? AppColors.primary,
              ),
            ),
            elevation: 0,
          ),
          onPressed: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null && position == IconPosition.leading) ...[
                Icon(icon!),
                SizedBox(width: _isSmall ? 8 : 16),
              ],
              Text(
                label,
              ),
              if (icon != null && position == IconPosition.trailing) ...[
                SizedBox(width: _isSmall ? 8 : 16),
                Icon(icon!),
              ],
            ],
          ),
        ),
      );
}
