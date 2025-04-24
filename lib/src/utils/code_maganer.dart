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
  }) =>
      SfBarcodeGenerator(
        value: data,
        symbology: symbology ?? EAN13(),
        showValue: showValue,
        backgroundColor: backgroundColor,
        textStyle: style,
      );
}
