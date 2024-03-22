import 'dart:developer';

import 'package:oxidized/oxidized.dart';
import 'package:test_evertec/app/core/http/client.dart';
import 'package:test_evertec/app/core/models/covid.dart';
import 'package:test_evertec/app/core/models/failure.dart';

class HomeRepository {
  final Http client;
  HomeRepository({required this.client});

  Future<Result<List<CovidData>, Failure>> getCovidData() async {
    final response = await client.get('/us/current.json');

    return response.when(
      ok: (data) {
        final List<CovidData> covidData = [];
        for (final item in data) {
          covidData.add(CovidData.fromMap(item));
        }
        return Result.ok(covidData);
      },
      err: (failure) {
        return Result.err(failure);
      },
    );
  }
}
