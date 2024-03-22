part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  final Model model;
  const HomeState(this.model);

  @override
  List<Object> get props => [
        model,
      ];
}

final class HomeInitial extends HomeState {
  const HomeInitial(super.model);
}

class LoadedState extends HomeState {
  const LoadedState(super.model);
}

class ErrorState extends HomeState {
  const ErrorState(super.model, this.error);
  final Failure error;
}

class Model extends Equatable {
  final DeviceData deviceData;
  final CovidData covidData;

  Model({
    DeviceData? deviceData,
    CovidData? covidData,
  })  : deviceData = deviceData ?? DeviceData.empty(),
        covidData = covidData ?? CovidData.empty();

  Model copyWith({
    DeviceData? deviceData,
    CovidData? covidData,
  }) {
    return Model(
      deviceData: deviceData ?? this.deviceData,
      covidData: covidData ?? this.covidData,
    );
  }

  @override
  List<Object?> get props {
    return [
      deviceData,
      covidData,
    ];
  }
}
