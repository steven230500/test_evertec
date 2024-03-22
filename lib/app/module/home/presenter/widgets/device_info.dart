import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_evertec/app/module/home/presenter/bloc/home/home_bloc.dart';

class DeviceInfoContainer extends StatelessWidget {
  const DeviceInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is LoadedState) {
          final deviceInfo = [
            {
              'key': 'Fecha actual',
              'value': DateFormat('hh:mm:ss a').format(DateTime.now()),
              'isSpecial': true,
            },
            {
              'key': 'Nombre del dispositivo',
              'value': state.model.deviceData.deviceName,
              'isSpecial': false
            },
            {
              'key': 'Marca del dispositivo',
              'value': state.model.deviceData.deviceBrand,
              'isSpecial': false
            },
            {
              'key': 'Tipo de dispositivo',
              'value': state.model.deviceData.deviceType,
              'isSpecial': false
            },
            {
              'key': 'Modelo del dispositivo',
              'value': state.model.deviceData.deviceModel,
              'isSpecial': false
            },
            {
              'key': 'Sistema operativo y su versión',
              'value': state.model.deviceData.osVersion,
              'isSpecial': false
            },
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
              children: deviceInfo.map((info) {
                final key = info['key'] as String;
                final value = info['value'] as String;
                final isSpecial = info['isSpecial'] as bool;
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.41,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isSpecial) ...[
                        Text(key,
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black)),
                        const SizedBox(height: 4),
                        Text(value, style: const TextStyle(fontSize: 10, color: Colors.black))
                      ] else ...[
                        Text(value, style: const TextStyle(fontSize: 18, color: Colors.black)),
                        Text(key,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
                      ]
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        } else if (state is ErrorState) {
          return Text('Error: ${state.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
