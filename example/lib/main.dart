// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Uint8List? barCodeData;
  Uint8List? imageBytes;
  String? imagePath;

  final barCodeKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // if (mounted) {
    //   Utility.updateLater(generateBytes);
    // }
  }

  void generateBytes() async {
    barCodeData = await Utility.captureFromWidget(
      SizedBox(
        height: 50,
        child: CodeManager.generateBarCode('7D101231752'),
      ),
      context: context,
    );

    setState(() {});
  }

  void pickImage() async {
    final data = await Utility.pickImageBytes();
    if (data == null) {
      return;
    }
    imageBytes = data;
    // imageBytes = json.decode(data);
    // await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  void pickImagePath() async {
    final data = await Utility.pickImageBlob();
    if (data == null) {
      return;
    }
    imagePath = data;
    // imageBytes = json.decode(data);
    // await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            children: [
              // RepaintBoundary(
              //   key: barCodeKey,
              //   child: SizedBox(
              //     height: 50,
              //     child: CodeManager.generateBarCode('7D101231752'),
              //   ),
              // ),
              // const SizedBox(height: 40),
              // if (barCodeData != null) ...[
              //   const SizedBox(height: 40),
              //   Image.memory(barCodeData!),
              // ],
              ElevatedButton(
                onPressed: pickImagePath,
                child: const Text('Pick image'),
              ),
              if (imageBytes != null) ...[
                const SizedBox(height: 40),
                Image(image: MemoryImage(imageBytes!)),
              ],
              if (imagePath != null) ...[
                const SizedBox(height: 40),
                Image(image: NetworkImage(imagePath!)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
