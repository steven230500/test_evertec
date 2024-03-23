import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_evertec/app/core/models/state_info.dart';
import 'package:test_evertec/app/core/module.dart';
import 'package:test_evertec/app/module/state/presenter/page/page.dart';

class StateModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) {
        final stateInfo = r.args.data as StateInfo;

        return StatePage(stateInfo: stateInfo);
      },
      transition: TransitionType.fadeIn,
    );
  }
}
