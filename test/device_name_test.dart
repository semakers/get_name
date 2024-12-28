import 'package:flutter_test/flutter_test.dart';
import 'package:device_name/device_name.dart';
import 'package:device_name/device_name_platform_interface.dart';
import 'package:device_name/device_name_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceNamePlatform
    with MockPlatformInterfaceMixin
    implements DeviceNamePlatform {
  @override
  Future<String?> getName() => Future.value('42');
}

void main() {
  final DeviceNamePlatform initialPlatform = DeviceNamePlatform.instance;

  test('$MethodChannelDeviceName is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDeviceName>());
  });

  test('getPlatformVersion', () async {
    DeviceName deviceNamePlugin = DeviceName();
    MockDeviceNamePlatform fakePlatform = MockDeviceNamePlatform();
    DeviceNamePlatform.instance = fakePlatform;

    expect(await deviceNamePlugin.getName(), '42');
  });
}
