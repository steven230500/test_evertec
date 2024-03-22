import 'dart:developer';

import 'package:oxidized/oxidized.dart';
import 'package:test_evertec/app/core/http/client.dart';
import 'package:test_evertec/app/core/models/covid_state.dart';
import 'package:test_evertec/app/core/models/state_info.dart';
import 'package:test_evertec/app/core/models/failure.dart';

class DetailsRepository {
  final Http client;

  DetailsRepository({required this.client});

  Future<Result<List<StateInfo>, Failure>> getStateInfo() async {
    final response = await client.get('/states/info.json');

    return response.when(
      ok: (data) {
        final List<dynamic> jsonData = data as List<dynamic>;
        final List<StateInfo> stateInfoList =
            jsonData.map((item) => StateInfo.fromMap(item as Map<String, dynamic>)).toList();
        return Ok(stateInfoList);
      },
      err: (error) {
        log('Error fetching state info: $error');
        return Err(Failure(error.toString()));
      },
    );
  }

  Future<Result<List<CovidStateData>, Failure>> getCovidStateData() async {
    final response = await client.get('/states/current.json');

    return response.when(
      ok: (data) {
        final List<dynamic> jsonData = data as List<dynamic>;
        final List<CovidStateData> covidStateDataList =
            jsonData.map((item) => CovidStateData.fromMap(item as Map<String, dynamic>)).toList();
        return Ok(covidStateDataList);
      },
      err: (error) {
        log('Error fetching Covid state data: $error');
        return Err(Failure(error.toString()));
      },
    );
  }
}
