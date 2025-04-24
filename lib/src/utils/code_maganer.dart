import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class CodeManager {
  const CodeManager._();

  static Widget generateQrCode(
    String data, {
    bool showValue = true,
    Color backgroundColor = Colors.white,
    TextStyle? style,
    Symbology? symbology,
  }) =>
      SfBarcodeGenerator(
        value: data,
        symbology: symbology ?? QRCode(),
        showValue: showValue,
        backgroundColor: backgroundColor,
        textStyle: style,
      );

  static Widget generateBarCode(
    String data, {
    bool showValue = true,
    Color backgroundColor = Colors.white,
    TextStyle? style,
    Symbology? symbology,
    bool useDefaultSymbology = true,
  }) =>
      SfBarcodeGenerator(
        value: data,
        symbology: symbology ?? _barcodeSymbology(data, useDefaultSymbology),
        showValue: showValue,
        backgroundColor: backgroundColor,
        textStyle: style,
      );

  static Symbology _barcodeSymbology(
    String data,
    bool useDefaultSymbology,
  ) =>
      useDefaultSymbology
          ? Code128()
          : switch (data.length) {
              13 || 12 => EAN13(),
              11 => UPCA(),
              8 || 7 => EAN8(),
              6 => UPCE(),
              _ => Code128(),
            };
}
