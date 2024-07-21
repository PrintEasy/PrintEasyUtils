import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:printeasy_utils/printeasy_utils_platform_interface.dart';

/// An implementation of [PrinteasyUtilsPlatform] that uses method channels.
class MethodChannelPrinteasyUtils extends PrinteasyUtilsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('printeasy_utils');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
