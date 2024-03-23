import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_evertec/app/core/models/covid_state.dart';
import 'package:test_evertec/app/module/details/presenter/bloc/details_bloc.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<DetailsBloc>()..add(LoadDetailsData()),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles por región'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.navigate('/home');
          },
        ),
      ),
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DetailsLoaded) {
            return ListView.builder(
              itemCount: state.model.stateInfoList.length,
              itemBuilder: (context, index) {
                final stateInfo = state.model.stateInfoList[index];
                final covidData = state.model.covidStateDataList.firstWhere(
                  (data) => data.state.toLowerCase() == stateInfo.state.toLowerCase(),
                  orElse: () => CovidStateData.empty(),
                );
                return GestureDetector(
                  onTap: () => Modular.to.navigate('/state', arguments: stateInfo),
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey[400]!, width: 1),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.flag),
                      ),
                      title: Text(stateInfo.name),
                      subtitle: Text(
                        'Casos totales: ${covidData.positive}\nÚltima modificación: ${covidData.lastUpdateEt}',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                );
              },
            );
          } else if (state is DetailsError) {
            return Center(child: Text('Error: ${state.error.toString()}'));
          }
          return const Center(child: Text('Cargando...'));
        },
      ),
    );
  }
}
