import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_evertec/app/core/config/config.dart';
import 'package:test_evertec/app/core/utils/preferences.dart';

part 'event.dart';
part 'state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final Preferences prefs;
  final AppConfig appConfig;

  SplashBloc({
    required this.prefs,
    required this.appConfig,
  }) : super(const InitialState(Model(progress: 0, isSessionActive: false))) {
    on<InitializeEvent>(_onInitialize);
    on<SimulateProgress>(_simulateProgress);
  }

  void _onInitialize(SplashEvent event, Emitter<SplashState> emit) async {
    await prefs.init();

    emit(InitialState(state.model.copyWith(isSessionActive: true)));

    add(SimulateProgress());
  }

  void _simulateProgress(SplashEvent event, Emitter<SplashState> emit) async {
    const int totalDurationSeconds = 5;
    for (int currentSecond = 1; currentSecond <= totalDurationSeconds; currentSecond++) {
      await Future.delayed(const Duration(seconds: 1));
      if (isClosed) return;
      emit(LoadingState(state.model.copyWith(progress: currentSecond / totalDurationSeconds)));
    }
    if (isClosed) return;

    _finishLoading(emit);
  }

  void _finishLoading(Emitter<SplashState> emit) async {
    emit(LoadedState(state.model.copyWith(isSessionActive: state.model.isSessionActive)));
  }
}
