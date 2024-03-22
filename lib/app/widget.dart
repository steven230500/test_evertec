import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_evertec/app/module/home/presenter/bloc/theme/theme_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Modular.get<ThemeBloc>()..add(InitTheme()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return GestureDetector(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Test Evertec',
              routerConfig: Modular.routerConfig,
              theme: state.themeData,
            ),
            onTap: () {
              final currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
          );
        },
      ),
    );
  }
}
