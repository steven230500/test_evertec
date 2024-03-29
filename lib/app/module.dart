import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_evertec/app/core/module.dart';
import 'package:test_evertec/app/module/auth/module.dart';
import 'package:test_evertec/app/module/details/module.dart';
import 'package:test_evertec/app/module/home/module.dart';
import 'package:test_evertec/app/module/home/presenter/bloc/theme/theme_bloc.dart';
import 'package:test_evertec/app/module/splash/module.dart';
import 'package:test_evertec/app/module/state/module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {
    i.addLazySingleton(ThemeBloc.new);
  }

  @override
  void routes(r) {
    r.module('/', module: SplashModule());
    r.module(
      '/auth',
      module: AuthModule(),
      transition: TransitionType.fadeIn,
    );
    r.module(
      '/home',
      module: HomeModule(),
      transition: TransitionType.fadeIn,
    );
    r.module(
      '/details',
      module: DetailsModule(),
      transition: TransitionType.fadeIn,
    );
    r.module(
      '/state',
      module: StateModule(),
      transition: TransitionType.fadeIn,
    );
  }
}
