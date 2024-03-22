import 'package:intl/intl.dart';
import 'package:test_evertec/app/core/models/device_data.dart';

List<Map<String, dynamic>> buildDeviceInfoItems(DeviceData deviceData) {
  return [
    {
      'key': 'Fecha actual',
      'value': DateFormat('EEEE, MMMM d, yyyy').format(DateTime.now()),
      'isSpecial': true,
    },
    {
      'key': 'Hora actual',
      'value': DateFormat('hh:mm:ss a').format(DateTime.now()),
      'isSpecial': true,
    },
    {
      'key': 'Marca del dispositivo',
      'value': deviceData.deviceBrand,
      'isSpecial': false,
    },
    {
      'key': 'Modelo del dispositivo',
      'value': deviceData.deviceModel,
      'isSpecial': false,
    },
    {
      'key': 'Nombre del dispositivo',
      'value': deviceData.deviceName,
      'isSpecial': false,
    },
    {
      'key': 'Tipo de dispositivo',
      'value': deviceData.deviceType,
      'isSpecial': false,
    },
    {
      'key': 'Sistema operativo y su versión',
      'value': deviceData.osVersion,
      'isSpecial': false,
    },
  ];
}
