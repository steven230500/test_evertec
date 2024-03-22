import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_evertec/app/core/module.dart';
import 'package:test_evertec/app/module/details/presenter/bloc/details_bloc.dart';
import 'package:test_evertec/app/module/details/presenter/page/page.dart';
import 'package:test_evertec/app/module/details/repository/repository.dart';

class DetailsModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {
    i.addLazySingleton(DetailsRepository.new);
    i.addLazySingleton(DetailsBloc.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => const DetailsPage(),
      transition: TransitionType.fadeIn,
    );
  }
}
