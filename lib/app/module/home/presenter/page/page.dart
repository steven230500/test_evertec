import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_evertec/app/core/models/covid.dart';
import 'package:test_evertec/app/module/home/presenter/bloc/home/home_bloc.dart';
import 'package:test_evertec/app/module/home/presenter/widgets/custom_switch.dart';
import 'package:test_evertec/app/module/home/presenter/widgets/data_container.dart';
import 'package:test_evertec/app/module/home/presenter/widgets/device_info.dart';

part '../widgets/covid_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<HomeBloc>()
        ..add(LoadDeviceInfo())
        ..add(LoadCovidData()),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is CloseSesionState) {
          Modular.to.navigate('/');
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Modular.to.navigate('/details');
          },
          backgroundColor: Colors.orange,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/splash.png',
                          width: MediaQuery.of(context).size.width * 0.24,
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Image.asset(
                              'assets/images/home.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Modular.get<HomeBloc>().add(CloseSesion());
                            },
                            icon: const Icon(
                              Icons.logout,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 3,
                    child: DataContainer(),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.21),
                  child: const DeviceInfoContainer(),
                ),
              ),
              Positioned(
                bottom: (MediaQuery.of(context).size.height / 2) * 0.95,
                right: 10,
                child: const CustomSwitch(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
