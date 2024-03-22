part of 'details_bloc.dart';

sealed class DetailsState extends Equatable {
  final Model model;
  const DetailsState(this.model);

  @override
  List<Object> get props => [model];
}

class DetailsInitial extends DetailsState {
  const DetailsInitial(super.model);
}

class DetailsLoading extends DetailsState {
  const DetailsLoading(super.model);
}

class DetailsLoaded extends DetailsState {
  const DetailsLoaded(super.model);
}

class DetailsError extends DetailsState {
  const DetailsError(super.model, this.error);
  final Failure error;

  @override
  List<Object> get props => [model, error];
}

class Model extends Equatable {
  final List<StateInfo> stateInfoList;
  final List<CovidStateData> covidStateDataList;

  Model({
    List<StateInfo>? stateInfoList,
    List<CovidStateData>? covidStateDataList,
  })  : stateInfoList = stateInfoList ?? [],
        covidStateDataList = covidStateDataList ?? [];

  Model copyWith({
    List<StateInfo>? stateInfoList,
    List<CovidStateData>? covidStateDataList,
  }) {
    return Model(
      stateInfoList: stateInfoList ?? this.stateInfoList,
      covidStateDataList: covidStateDataList ?? this.covidStateDataList,
    );
  }

  @override
  List<Object> get props => [stateInfoList, covidStateDataList];
}
