import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class DropDown<T> extends StatelessWidget {
  const DropDown({
    super.key,
    this.label,
    this.hintText,
    required this.items,
    this.itemBuilder,
    this.selectedItemBuilder,
    this.itemStyle,
    this.value,
    required this.onChanged,
    this.validator,
    this.radius,
    this.borderColor,
    this.contentPadding,
  });

  final String? label;
  final String? hintText;
  final List<T> items;
  final Widget Function(BuildContext, T)? itemBuilder;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final TextStyle? itemStyle;
  final T? value;
  final void Function(T?) onChanged;
  final String? Function(T?)? validator;
  final double? radius;
  final Color? borderColor;
  final EdgeInsets? contentPadding;

  InputDecorationTheme _decorationTheme(BuildContext context) => context.theme.inputDecorationTheme;

  InputBorder _border(BuildContext context) =>
      _decorationTheme(context).border ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 12),
        borderSide: BorderSide(
          color: borderColor ?? AppColors.grey,
          width: 1,
        ),
      );

  InputBorder _enabledBorder(BuildContext context) =>
      _decorationTheme(context).enabledBorder ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 12),
        borderSide: BorderSide(
          color: borderColor ?? AppColors.grey,
          width: 1,
        ),
      );

  InputBorder _focusedBorder(BuildContext context) =>
      _decorationTheme(context).focusedBorder ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 12),
        borderSide: BorderSide(
          color: borderColor ?? AppColors.secondary,
          width: 2,
        ),
      );

  InputBorder _errorBorder(BuildContext context) =>
      _decorationTheme(context).errorBorder ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 12),
        borderSide: BorderSide(
          color: borderColor ?? AppColors.error,
          width: 1,
        ),
      );

  InputBorder _disabledBorder(BuildContext context) =>
      _decorationTheme(context).focusedErrorBorder ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 12),
        borderSide: BorderSide(
          color: borderColor ?? AppColors.grey,
          width: 1,
        ),
      );

  InputBorder _focusedErrorBorder(BuildContext context) =>
      _decorationTheme(context).focusedErrorBorder ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 12),
        borderSide: BorderSide(
          color: borderColor ?? AppColors.error,
          width: 1,
        ),
      );

  @override
  Widget build(BuildContext context) => ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField<T>(
            alignment: Alignment.centerLeft,
            items: items
                .map(
                  (type) => DropdownMenuItem<T>(
                    value: type,
                    child: itemBuilder?.call(context, type) ??
                        Text(
                          '$type',
                          style: itemStyle ??
                              const TextStyle(
                                color: Colors.black,
                              ),
                        ),
                  ),
                )
                .toList(),
            selectedItemBuilder: selectedItemBuilder,
            validator: validator,
            decoration: InputDecoration(
              filled: true,
              fillColor: _decorationTheme(context).fillColor ?? Colors.white70,
              alignLabelWithHint: _decorationTheme(context).alignLabelWithHint,
              labelText: label,
              contentPadding: contentPadding ?? _decorationTheme(context).contentPadding ?? const EdgeInsets.all(16),
              hintText: hintText ?? (label != null ? 'Enter $label' : null),
              labelStyle: _decorationTheme(context).labelStyle,
              border: _border(context),
              enabledBorder: _enabledBorder(context),
              focusedBorder: _focusedBorder(context),
              errorBorder: _errorBorder(context),
              disabledBorder: _disabledBorder(context),
              focusedErrorBorder: _focusedErrorBorder(context),
              counterText: '',
              errorMaxLines: 2,
            ),
            isDense: true,
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            iconEnabledColor: Colors.black,
            value: value,
            onChanged: onChanged,
            focusColor: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            dropdownColor: AppColors.white,
          ),
        ),
      );
}
