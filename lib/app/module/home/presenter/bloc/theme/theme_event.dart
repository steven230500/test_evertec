part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final bool isDarkMode;

  const ThemeChanged({required this.isDarkMode});

  @override
  List<Object> get props => [isDarkMode];
}

class InitTheme extends ThemeEvent {}
