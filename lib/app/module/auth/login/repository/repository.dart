import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:oxidized/oxidized.dart';
import 'package:test_evertec/app/module/auth/login/domain/dto/usecase.dart';

class LoginRepository {
  Future<Result<List<UserRequestDTO>, String>> fetchUsers() async {
    try {
      final String response = await rootBundle.loadString('assets/json/auth.json');
      final List<dynamic> data = json.decode(response)['users'];
      final List<UserRequestDTO> users =
          data.map((userData) => UserRequestDTO.fromMap(userData)).toList();
      return Ok(users);
    } catch (e) {
      return const Err('No se pudo cargar los usuarios');
    }
  }
}
