import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:test_evertec/app/core/config/config.dart';
import 'package:test_evertec/app/core/http/client.dart';
import 'package:test_evertec/app/core/http/dio/dio.dart';
import 'package:test_evertec/app/core/shared/strings.dart';
import 'package:test_evertec/app/core/utils/preferences.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(i) {
    i.addLazySingleton<Http>(DioHttpClient.new);
    i.addLazySingleton(Preferences.new);
    i.addLazySingleton(() {
      return createAppInstance(i);
    });
  }

  AppConfig createAppInstance(Injector i) {
    const appEnv = bool.fromEnvironment('dart.vm.product') ? AppEnv.prod : AppEnv.dev;
    const baseUrl = appEnv == AppEnv.prod ? Contants.baseUrlProd : Contants.baseUrlDev;

    return AppConfig(
      baseUrl: baseUrl,
      env: appEnv,
      log: Logger(
        printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 8,
          lineLength: 120,
          colors: true,
          printEmojis: true,
          printTime: true,
        ),
      ),
      logout: () async {
        await i.get<Preferences>().clear();
        Modular.to.navigate('/');
      },
    );
  }
}
