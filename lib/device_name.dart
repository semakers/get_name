import 'device_name_platform_interface.dart';

class DeviceName {
  Future<String?> getName() {
    return DeviceNamePlatform.instance.getName();
  }
}
