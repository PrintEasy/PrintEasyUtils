import 'package:flutter/material.dart';
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
  });

  final String? label;
  final String? hintText;
  final List<T> items;
  final Widget Function(BuildContext, T)? itemBuilder;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final TextStyle? itemStyle;
  final T? value;
  final void Function(T?) onChanged;

  OutlineInputBorder get _border => OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      );

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<T>(
              alignment: Alignment.centerLeft,
              hint: Text(
                hintText ?? 'Select $label',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
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
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white70,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                border: _border,
                focusedBorder: _border,
                enabledBorder: _border,
                disabledBorder: _border,
                focusedErrorBorder: _border,
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
        ),
      );
}
