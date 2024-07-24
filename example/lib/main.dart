// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Uint8List? barCodeData;
  Uint8List? qrCodeData;

  final barCodeKey = GlobalKey();
  final qrCodeKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Utility.updateLater(_generateBytes);
  }

  void _generateBytes() async {
    qrCodeData = await Utility.captureFromWidget(
      SizedBox(
        height: 100,
        child: CodeManager.generateQrCode('printeasy.store'),
      ),
      context: context,
    );
    barCodeData = await Utility.captureFromWidget(
      SizedBox(
        height: 50,
        child: CodeManager.generateBarCode('7D101231752'),
      ),
      context: context,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                RepaintBoundary(
                  key: barCodeKey,
                  child: SizedBox(
                    height: 50,
                    child: CodeManager.generateBarCode('7D101231752'),
                  ),
                ),
                const SizedBox(height: 40),
                RepaintBoundary(
                  key: qrCodeKey,
                  child: SizedBox(
                    height: 100,
                    child: CodeManager.generateQrCode('printeasy.store'),
                  ),
                ),
                if (barCodeData != null) ...[
                  const SizedBox(height: 40),
                  Image.memory(barCodeData!),
                ],
                if (qrCodeData != null) ...[
                  const SizedBox(height: 40),
                  Image.memory(qrCodeData!),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
