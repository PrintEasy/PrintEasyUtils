import 'package:flutter/material.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            const AppLogo(),
            const AppSvg(AssetConstants.google),
            Image.asset(
              AssetConstants.logo,
              package: PrintEasyConstants.appName,
            ),
            Image.asset(
              'packages/${PrintEasyConstants.appName}/${AssetConstants.logo}',
            ),
          ],
        ),
      ),
    );
  }
}
