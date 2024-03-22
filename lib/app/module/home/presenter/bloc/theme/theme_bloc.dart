import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_evertec/app/core/utils/preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final Preferences preferences;

  ThemeBloc({required this.preferences}) : super(ThemeInitial()) {
    on<ThemeChanged>((event, emit) async {
      preferences.isDarkMode = event.isDarkMode;
      emit(ThemeDataChanged(themeData: event.isDarkMode ? ThemeData.dark() : ThemeData.light()));
    });

    on<InitTheme>((event, emit) async {
      await preferences.init();
      final isDarkMode = preferences.isDarkMode;
      emit(ThemeDataChanged(themeData: isDarkMode ? ThemeData.dark() : ThemeData.light()));
    });
  }
}
