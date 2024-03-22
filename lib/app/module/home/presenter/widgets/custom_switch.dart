import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_evertec/app/module/home/presenter/bloc/theme/theme_bloc.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        bool isDarkMode = state.themeData.brightness == Brightness.dark;

        return GestureDetector(
          onTap: () {
            context.read<ThemeBloc>().add(ThemeChanged(isDarkMode: !isDarkMode));
          },
          child: Container(
            width: 80,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(22.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDarkMode ? Colors.transparent : Colors.white,
                  ),
                  child: const Icon(Icons.wb_sunny, color: Colors.yellow),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDarkMode ? Colors.white : Colors.transparent,
                  ),
                  child: const Icon(Icons.nightlight_round, color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
