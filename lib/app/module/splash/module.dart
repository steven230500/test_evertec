import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_evertec/app/core/module.dart';
import 'package:test_evertec/app/module/auth/module.dart';
import 'package:test_evertec/app/module/splash/presenter/bloc/bloc.dart';
import 'package:test_evertec/app/module/splash/presenter/page/page.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {
    i.addLazySingleton(SplashBloc.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => const SplashPage(),
      transition: TransitionType.fadeIn,
    );
    r.module(
      '/auth',
      module: AuthModule(),
      transition: TransitionType.fadeIn,
    );
  }
}
