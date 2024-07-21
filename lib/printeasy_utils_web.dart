// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:printeasy_utils/printeasy_utils_platform_interface.dart';
import 'package:web/web.dart' as web;

/// A web implementation of the PrinteasyUtilsPlatform of the PrinteasyUtils plugin.
class PrinteasyUtilsWeb extends PrinteasyUtilsPlatform {
  /// Constructs a PrinteasyUtilsWeb
  PrinteasyUtilsWeb();

  static void registerWith(Registrar registrar) {
    PrinteasyUtilsPlatform.instance = PrinteasyUtilsWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = web.window.navigator.userAgent;
    return version;
  }
}
