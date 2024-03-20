import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/module.dart';
import 'app/widget.dart';

void main() async {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
