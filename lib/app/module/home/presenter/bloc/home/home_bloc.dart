import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:test_evertec/app/core/models/covid.dart';
import 'package:test_evertec/app/core/models/device_data.dart';
import 'package:test_evertec/app/core/models/failure.dart';
import 'package:test_evertec/app/module/home/repository/repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  HomeBloc({required this.homeRepository}) : super(HomeInitial(Model())) {
    on<LoadDeviceInfo>(_onLoadDeviceInfo);
    on<LoadCovidData>(_onLoadCovidData);
  }

  Future<void> _onLoadCovidData(LoadCovidData event, Emitter<HomeState> emit) async {
    final result = await homeRepository.getCovidData();
    result.match(
      (covidData) {
        emit(LoadedState(state.model.copyWith(covidData: covidData.first)));
      },
      (failure) {
        emit(
          ErrorState(
            state.model,
            Failure(failure.message),
          ),
        );
      },
    );
  }

  Future<void> _onLoadDeviceInfo(LoadDeviceInfo event, Emitter<HomeState> emit) async {
    DeviceData deviceData;
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        deviceData = DeviceData(
          currentTime: DateTime.now().toString(),
          deviceBrand: androidInfo.brand,
          deviceModel: androidInfo.model,
          deviceName: androidInfo.device,
          deviceType: "Teléfono",
          osVersion: "Android ${androidInfo.version.release}",
        );
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        deviceData = DeviceData(
          currentTime: DateTime.now().toString(),
          deviceBrand: "Apple",
          deviceModel: iosInfo.model,
          deviceName: iosInfo.name,
          deviceType: "iOS Device",
          osVersion: "iOS ${iosInfo.systemVersion}",
        );
      } else {
        throw Exception("Plataforma no soportada");
      }
      emit(LoadedState(state.model.copyWith(deviceData: deviceData)));
    } catch (e) {
      emit(
        ErrorState(
          state.model,
          Failure(e.toString()),
        ),
      );
    }
  }
}
