import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:test_evertec/app/core/models/user.dart';

class AppConfig {
  AppConfig({
    required this.baseUrl,
    required this.env,
    required this.log,
    required this.logout,
  });

  final String baseUrl;
  final AppEnv env;
  final Logger log;
  final VoidCallback logout;

  static void logError(error, [stackTrace]) {
    final logger = Logger();
    logger.e([error, stackTrace]);
  }

  User? _user;
  User? get user => _user;
  set user(User? user) {
    if (user != null) {
      _user = user;
    }
  }
}

enum AppEnv { prod, dev }
