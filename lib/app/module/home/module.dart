import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_evertec/app/core/module.dart';
import 'package:test_evertec/app/module/home/presenter/bloc/home_bloc.dart';
import 'package:test_evertec/app/module/home/presenter/page/page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {
    i.addLazySingleton(HomeBloc.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => const HomePage(),
      transition: TransitionType.fadeIn,
    );
  }
}
