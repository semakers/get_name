import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_name_method_channel.dart';

abstract class DeviceNamePlatform extends PlatformInterface {
  /// Constructs a DeviceNamePlatform.
  DeviceNamePlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceNamePlatform _instance = MethodChannelDeviceName();

  /// The default instance of [DeviceNamePlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceName].
  static DeviceNamePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceNamePlatform] when
  /// they register themselves.
  static set instance(DeviceNamePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getName() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
