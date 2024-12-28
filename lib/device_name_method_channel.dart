import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_name_platform_interface.dart';

/// An implementation of [DeviceNamePlatform] that uses method channels.
class MethodChannelDeviceName extends DeviceNamePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.nairda/device_name');

  @override
  Future<String?> getName() async {
    final version = await methodChannel.invokeMethod<String>('getDeviceName');
    return version;
  }
}
