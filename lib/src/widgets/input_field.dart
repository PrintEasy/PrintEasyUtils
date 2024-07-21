import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.obscureCharacter = ' ',
    this.suffixIcon,
    this.prefixIcon,
    this.prefixText,
    this.textInputType,
    this.readOnly = false,
    this.onTap,
    this.label,
    this.hintText,
    this.borderColor,
    this.fillColor,
    this.hintStyle,
    this.alignLabelWithHint,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.cursorColor,
    this.style,
    this.radius,
    this.onFieldSubmit,
    this.textInputAction,
    this.contentPadding,
    this.focusNode,
    this.textCapitalization,
    this.autofillHints,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final Function(String value)? onChanged;
  final bool obscureText;
  final String obscureCharacter;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? prefixText;
  final bool readOnly;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmit;
  final String? label;
  final String? hintText;
  final Color? borderColor;
  final Color? fillColor;
  final Color? cursorColor;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final bool? alignLabelWithHint;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final double? radius;
  final TextInputAction? textInputAction;
  final EdgeInsets? contentPadding;
  final FocusNode? focusNode;
  final TextCapitalization? textCapitalization;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;

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
  Widget build(BuildContext context) => Material(
        type: MaterialType.transparency,
        child: TextFormField(
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmit,
          maxLength: maxLength,
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          style: style,
          onTap: onTap,
          cursorColor: cursorColor,
          readOnly: readOnly,
          controller: controller,
          autofillHints: autofillHints,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: _decorationTheme(context).labelStyle,
            filled: true,
            alignLabelWithHint: _decorationTheme(context).alignLabelWithHint,
            fillColor: fillColor ?? _decorationTheme(context).fillColor ?? Colors.white70,
            hintText: hintText ?? (label != null ? 'Enter $label' : null),
            hintStyle: hintStyle ?? _decorationTheme(context).hintStyle,
            isDense: _decorationTheme(context).isDense,
            contentPadding: contentPadding ?? _decorationTheme(context).contentPadding ?? const EdgeInsets.all(16),
            border: _border(context),
            enabledBorder: _enabledBorder(context),
            focusedBorder: _focusedBorder(context),
            errorBorder: _errorBorder(context),
            disabledBorder: _disabledBorder(context),
            focusedErrorBorder: _focusedErrorBorder(context),
            counterText: '',
            errorMaxLines: 2,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            prefixText: prefixText,
          ),
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          inputFormatters: inputFormatters,
          obscureText: obscureText,
          obscuringCharacter: obscureCharacter,
          onChanged: onChanged,
        ),
      );
}
