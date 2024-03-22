part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  final ThemeData themeData;

  const ThemeState({required this.themeData});

  @override
  List<Object> get props => [themeData];
}

class ThemeInitial extends ThemeState {
  ThemeInitial() : super(themeData: ThemeData.light());
}

class ThemeDataChanged extends ThemeState {
  const ThemeDataChanged({required ThemeData themeData}) : super(themeData: themeData);
}
