import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:printeasy_utils/printeasy_utils_method_channel.dart';

abstract class PrinteasyUtilsPlatform extends PlatformInterface {
  /// Constructs a PrinteasyUtilsPlatform.
  PrinteasyUtilsPlatform() : super(token: _token);

  static final Object _token = Object();

  static PrinteasyUtilsPlatform _instance = MethodChannelPrinteasyUtils();

  /// The default instance of [PrinteasyUtilsPlatform] to use.
  ///
  /// Defaults to [MethodChannelPrinteasyUtils].
  static PrinteasyUtilsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PrinteasyUtilsPlatform] when
  /// they register themselves.
  static set instance(PrinteasyUtilsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
