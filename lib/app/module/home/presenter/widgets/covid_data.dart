part of '../page/page.dart';

class CovidDataView extends StatelessWidget {
  final CovidData covidData;
  final Color backgroundColor;
  final Color textColor;

  const CovidDataView({
    Key? key,
    required this.covidData,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            "Fecha Recolección Datos: ${_formatDate(covidData.date)}",
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
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
          const SizedBox(height: 16),
          const Text(
            "El proyecto COVID Tracking ha finalizado toda recolección a partir del 7 de marzo de 2021.",
            style: TextStyle(fontSize: 12, color: Colors.black),
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
