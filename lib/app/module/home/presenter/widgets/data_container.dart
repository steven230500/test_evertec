import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  const DataContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12.0),
      ),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Fecha Recolección Datos: dd.mm.yyyy",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(6, (index) => _dataTile()), // Genera 6 tiles
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

  Widget _dataTile() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("103,318,299", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Casos totales"),
        ],
      ),
    );
  }
}
