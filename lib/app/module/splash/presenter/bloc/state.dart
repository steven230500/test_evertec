part of 'bloc.dart';

sealed class SplashState extends Equatable {
  final Model model;
  const SplashState(this.model);

  @override
  List<Object> get props => [model];
}

final class InitialState extends SplashState {
  const InitialState(super.model);
}

final class LoadedState extends SplashState {
  const LoadedState(super.model);
}

final class LoadingState extends SplashState {
  const LoadingState(super.model);
}

final class ErrorState extends SplashState {
  const ErrorState(super.model);
}

class Model extends Equatable {
  final bool isSessionActive;
  final double progress;

  const Model({this.isSessionActive = false, this.progress = 0.0});

  Model copyWith({
    bool? isSessionActive,
    double? progress,
  }) {
    return Model(
      isSessionActive: isSessionActive ?? this.isSessionActive,
      progress: progress ?? this.progress,
    );
  }

  @override
  List<Object> get props => [isSessionActive, progress];
}
