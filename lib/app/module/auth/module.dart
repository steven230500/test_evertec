import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_evertec/app/core/module.dart';
import 'package:test_evertec/app/module/auth/login/presenter/bloc/login_bloc.dart';
import 'package:test_evertec/app/module/auth/login/presenter/page/page.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {
    i.addLazySingleton(LoginBloc.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => const LoginPage(),
      transition: TransitionType.fadeIn,
    );
  }
}
