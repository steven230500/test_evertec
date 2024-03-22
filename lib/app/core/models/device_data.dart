class DeviceData {
  final String currentTime;
  final String deviceBrand;
  final String deviceModel;
  final String deviceName;
  final String deviceType;
  final String osVersion;

  DeviceData({
    required this.currentTime,
    required this.deviceBrand,
    required this.deviceModel,
    required this.deviceName,
    required this.deviceType,
    required this.osVersion,
  });
  factory DeviceData.empty() {
    return DeviceData(
      currentTime: '',
      deviceBrand: '',
      deviceModel: '',
      deviceName: '',
      deviceType: '',
      osVersion: '',
    );
  }
}
