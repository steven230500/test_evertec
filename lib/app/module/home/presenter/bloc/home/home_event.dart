part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadDeviceInfo extends HomeEvent {}

class LoadCovidData extends HomeEvent {}

class CloseSesion extends HomeEvent {}
