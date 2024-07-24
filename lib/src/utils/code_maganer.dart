import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class CodeManager {
  const CodeManager._();

  static Widget generateQrCode(String data) => SfBarcodeGenerator(
        value: data,
        symbology: QRCode(),
        showValue: false,
      );

  static Widget generateBarCode(String data) => SfBarcodeGenerator(
        value: data,
        symbology: Code128(),
        showValue: false,
      );
}
