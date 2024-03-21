import 'package:flutter/material.dart';

class DeviceInfoContainer extends StatelessWidget {
  const DeviceInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> deviceInfo = [
      {'Fecha actual': "02:35:00pm"},
      {'Marca del dispositivo': "XXXXX"},
      {'Modelo del dispositivo': "XXXXX"},
      {'Nombre del dispositivo': "XXXXX"},
      {'Tipo de dispositivo': "AAAAAA"},
      {'Sistema operativo y su versión': "A.B.CD"},
    ];

    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: deviceInfo
            .map(
              (info) => SizedBox(
                width: MediaQuery.of(context).size.width * 0.41,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      info.keys.first,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      info.values.first,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
