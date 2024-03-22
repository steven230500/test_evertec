import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxidized/oxidized.dart';
import 'package:test_evertec/app/core/models/covid_state.dart';
import 'package:test_evertec/app/core/models/failure.dart';
import 'package:test_evertec/app/core/models/state_info.dart';
import 'package:test_evertec/app/module/details/repository/repository.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final DetailsRepository detailsRepository;
  DetailsBloc({required this.detailsRepository}) : super(DetailsInitial(Model())) {
    on<LoadDetailsData>(_onLoadDetailsData);
  }

  Future<void> _onLoadDetailsData(LoadDetailsData event, Emitter<DetailsState> emit) async {
    emit(DetailsLoading(state.model));

    final results = await Future.wait([
      detailsRepository.getStateInfo(),
      detailsRepository.getCovidStateData(),
    ]);

    final stateInfoResult = results[0] as Result<List<StateInfo>, Failure>;
    final covidDataResult = results[1] as Result<List<CovidStateData>, Failure>;

    stateInfoResult.when(
      ok: (stateInfoList) {
        covidDataResult.when(
          ok: (covidStateDataList) {
            emit(DetailsLoaded(state.model.copyWith(
              stateInfoList: stateInfoList,
              covidStateDataList: covidStateDataList,
            )));
          },
          err: (error) => emit(DetailsError(state.model, error)),
        );
      },
      err: (error) => emit(DetailsError(state.model, error)),
    );
  }
}
