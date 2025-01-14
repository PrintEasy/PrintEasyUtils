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
    this.iconColor,
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
    this.iconColor,
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
    Color? iconColor,
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
        iconColor: iconColor,
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
    Color? iconColor,
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
        iconColor: iconColor,
      );

  final VoidCallback? onTap;
  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final IconData? icon;
  final String? iconPath;
  final IconPosition position;
  final Color? iconColor;

  final bool _isSmall;
  final double height;

  Color get _backgroundColor => backgroundColor ?? AppColors.primary;
  Color get _foregroundColor => foregroundColor ?? AppColors.white;
  Color get _borderColor => borderColor ?? _backgroundColor;
  Color get _iconColor => iconColor ?? _foregroundColor;
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
              borderRadius: BorderRadius.circular(12),
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
                _Icon(
                  icon: icon,
                  iconPath: iconPath,
                  color: _iconColor,
                ),
                SizedBox(width: _isSmall ? 8 : 16),
              ],
              Text(
                label,
              ),
              if ((icon != null || iconPath != null) && position == IconPosition.trailing) ...[
                SizedBox(width: _isSmall ? 8 : 16),
                _Icon(
                  icon: icon,
                  iconPath: iconPath,
                  color: _iconColor,
                ),
              ],
            ],
          ),
        ),
      );
}

class _Icon extends StatelessWidget {
  const _Icon({
    required this.icon,
    required this.iconPath,
    required this.color,
  });

  final IconData? icon;
  final String? iconPath;
  final Color color;

  @override
  Widget build(BuildContext context) => icon != null
      ? Icon(
          icon!,
          color: color,
        )
      : AppIcon(
          iconPath!,
          color: color,
        );
}
