import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_evertec/app/core/models/covid.dart';
import 'package:test_evertec/app/module/home/presenter/bloc/home/home_bloc.dart';

class DataContainer extends StatelessWidget {
  const DataContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is LoadedState) {
          final covidData = state.model.covidData;
          return _buildCovidDataView(covidData);
        } else if (state is ErrorState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Error: ${state.error.message}', style: const TextStyle(color: Colors.red)),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildCovidDataView(CovidData covidData) {
    final dataItems = [
      {"title": "Casos totales", "data": covidData.positive.toString()},
      {"title": "Casos confirmados", "data": covidData.positive.toString()},
      {"title": "Pruebas negativas", "data": covidData.negative.toString()},
      {"title": "Pruebas Positivas", "data": covidData.positive.toString()},
      {"title": "Fallecidos", "data": covidData.death.toString()},
      {"title": "Recuperados", "data": covidData.recovered?.toString() ?? 'No disponible'},
      {"title": "Pruebas pendientes", "data": covidData.pending?.toString() ?? 'No disponible'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            "Fecha Recolección Datos: ${_formatDate(covidData.date)}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: crossAxisCount == 4 ? 2.5 : 2.6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: dataItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return DataTile(
                    title: dataItems[index]["title"] ?? '',
                    data: dataItems[index]["data"] ?? '',
                  );
                },
              );
            },
          ),
          const SizedBox(height: 16), // Espacio después del grid
          const Text(
            "El proyecto COVID Tracking ha finalizado toda recolección a partir del 7 de marzo de 2021.",
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  String _formatDate(int date) {
    final year = date ~/ 10000;
    final month = (date % 10000) ~/ 100;
    final day = date % 100;
    return '$day.$month.$year';
  }
}

class DataTile extends StatelessWidget {
  final String title;
  final String data;
  const DataTile({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
