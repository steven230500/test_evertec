import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_evertec/app/core/module.dart';
import 'package:test_evertec/app/module/splash/module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/', module: SplashModule());
  }
}
