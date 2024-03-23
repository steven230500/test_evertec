import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_evertec/app/module/home/presenter/bloc/home/home_bloc.dart';
import 'package:test_evertec/app/module/home/presenter/page/page.dart';

class DataContainer extends StatelessWidget {
  const DataContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is LoadedState) {
          final covidData = state.model.covidData;
          final backgroundColor = Theme.of(context).colorScheme.surface;
          final textColor = Theme.of(context).colorScheme.onSurface;

          return CovidDataView(
            covidData: covidData,
            backgroundColor: backgroundColor,
            textColor: textColor,
          );
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
    final cardColor = Theme.of(context).colorScheme.surface;
    final textColor = Theme.of(context).colorScheme.onSurface;
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor)),
            const SizedBox(height: 4),
            Text(title, style: TextStyle(fontSize: 14, color: textColor)),
          ],
        ),
      ),
    );
  }
}
