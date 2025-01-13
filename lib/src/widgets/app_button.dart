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
    this.iconPath,
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
    this.iconPath,
    this.position = IconPosition.leading,
  })  : _isSmall = true,
        height = 40;

  factory AppButton.secondary({
    required VoidCallback onTap,
    required String label,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    String? iconPath,
    IconData? icon,
    IconPosition position = IconPosition.leading,
  }) =>
      AppButton(
        onTap: onTap,
        label: label,
        backgroundColor: backgroundColor ?? AppColors.white,
        foregroundColor: foregroundColor ?? AppColors.primary,
        borderColor: borderColor ?? foregroundColor ?? AppColors.primary,
        iconPath: iconPath,
        icon: icon,
        position: position,
      );

  factory AppButton.secondarySmall({
    required VoidCallback onTap,
    required String label,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    String? iconPath,
    IconData? icon,
    IconPosition position = IconPosition.leading,
  }) =>
      AppButton.small(
        onTap: onTap,
        label: label,
        backgroundColor: backgroundColor ?? AppColors.white,
        foregroundColor: foregroundColor ?? AppColors.primary,
        borderColor: borderColor ?? foregroundColor ?? AppColors.primary,
        iconPath: iconPath,
        icon: icon,
        position: position,
      );

  final VoidCallback? onTap;
  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final IconData? icon;
  final String? iconPath;
  final IconPosition position;

  final bool _isSmall;
  final double height;

  Color get _backgroundColor => backgroundColor ?? AppColors.primary;
  Color get _foregroundColor => foregroundColor ?? AppColors.white;
  Color get _borderColor => borderColor ?? _backgroundColor;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: _isSmall ? null : double.maxFinite,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _backgroundColor,
            foregroundColor: _foregroundColor,
            textStyle: context.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: _borderColor,
              ),
              borderRadius: BorderRadius.circular(_isSmall ? 12 : 16),
            ),
            elevation: 0,
          ),
          onPressed: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if ((icon != null || iconPath != null) && position == IconPosition.leading) ...[
                if (icon != null) ...[
                  Icon(
                    icon!,
                    color: _foregroundColor,
                  ),
                ] else if (iconPath != null) ...[
                  AppIcon(
                    iconPath!,
                    color: _foregroundColor,
                  ),
                ],
                SizedBox(width: _isSmall ? 8 : 16),
              ],
              Text(
                label,
              ),
              if ((icon != null || iconPath != null) && position == IconPosition.trailing) ...[
                SizedBox(width: _isSmall ? 8 : 16),
                if (icon != null) ...[
                  Icon(
                    icon!,
                    color: _foregroundColor,
                  ),
                ] else if (iconPath != null) ...[
                  AppIcon(
                    iconPath!,
                    color: _foregroundColor,
                  ),
                ],
              ],
            ],
          ),
        ),
      );
}
