import 'package:equatable/equatable.dart';

class CovidStateData extends Equatable {
  final String state;
  final int date;
  final int? death;
  final int? deathConfirmed;
  final int? deathIncrease;
  final int? deathProbable;
  final int? hospitalizedCurrently;
  final int? hospitalizedCumulative;
  final int? hospitalizedIncrease;
  final int? inIcuCurrently;
  final int? inIcuCumulative;
  final int? onVentilatorCurrently;
  final int? onVentilatorCumulative;
  final int? positive;
  final int? positiveCasesViral;
  final int? positiveIncrease;
  final int? recovered;
  final int? totalTestResults;
  final int? totalTestResultsIncrease;
  final String? lastUpdateEt;
  final String? dataQualityGrade;

  const CovidStateData({
    required this.state,
    required this.date,
    this.death,
    this.deathConfirmed,
    this.deathIncrease,
    this.deathProbable,
    this.hospitalizedCurrently,
    this.hospitalizedCumulative,
    this.hospitalizedIncrease,
    this.inIcuCurrently,
    this.inIcuCumulative,
    this.onVentilatorCurrently,
    this.onVentilatorCumulative,
    this.positive,
    this.positiveCasesViral,
    this.positiveIncrease,
    this.recovered,
    this.totalTestResults,
    this.totalTestResultsIncrease,
    this.lastUpdateEt,
    this.dataQualityGrade,
  });

  factory CovidStateData.empty() {
    return const CovidStateData(
      state: '',
      date: 0,
      death: 0,
      deathConfirmed: 0,
      deathIncrease: 0,
      deathProbable: 0,
      hospitalizedCurrently: 0,
      hospitalizedCumulative: 0,
      hospitalizedIncrease: 0,
      inIcuCurrently: 0,
      inIcuCumulative: 0,
      onVentilatorCurrently: 0,
      onVentilatorCumulative: 0,
      positive: 0,
      positiveCasesViral: 0,
      positiveIncrease: 0,
      recovered: 0,
      totalTestResults: 0,
      totalTestResultsIncrease: 0,
      lastUpdateEt: '',
      dataQualityGrade: '',
    );
  }

  CovidStateData copyWith({
    String? state,
    int? date,
    int? death,
    int? deathConfirmed,
    int? deathIncrease,
    int? deathProbable,
    int? hospitalizedCurrently,
    int? hospitalizedCumulative,
    int? hospitalizedIncrease,
    int? inIcuCurrently,
    int? inIcuCumulative,
    int? onVentilatorCurrently,
    int? onVentilatorCumulative,
    int? positive,
    int? positiveCasesViral,
    int? positiveIncrease,
    int? recovered,
    int? totalTestResults,
    int? totalTestResultsIncrease,
    String? lastUpdateEt,
    String? dataQualityGrade,
  }) {
    return CovidStateData(
      state: state ?? this.state,
      date: date ?? this.date,
      death: death ?? this.death,
      deathConfirmed: deathConfirmed ?? this.deathConfirmed,
      deathIncrease: deathIncrease ?? this.deathIncrease,
      deathProbable: deathProbable ?? this.deathProbable,
      hospitalizedCurrently: hospitalizedCurrently ?? this.hospitalizedCurrently,
      hospitalizedCumulative: hospitalizedCumulative ?? this.hospitalizedCumulative,
      hospitalizedIncrease: hospitalizedIncrease ?? this.hospitalizedIncrease,
      inIcuCurrently: inIcuCurrently ?? this.inIcuCurrently,
      inIcuCumulative: inIcuCumulative ?? this.inIcuCumulative,
      onVentilatorCurrently: onVentilatorCurrently ?? this.onVentilatorCurrently,
      onVentilatorCumulative: onVentilatorCumulative ?? this.onVentilatorCumulative,
      positive: positive ?? this.positive,
      positiveCasesViral: positiveCasesViral ?? this.positiveCasesViral,
      positiveIncrease: positiveIncrease ?? this.positiveIncrease,
      recovered: recovered ?? this.recovered,
      totalTestResults: totalTestResults ?? this.totalTestResults,
      totalTestResultsIncrease: totalTestResultsIncrease ?? this.totalTestResultsIncrease,
      lastUpdateEt: lastUpdateEt ?? this.lastUpdateEt,
      dataQualityGrade: dataQualityGrade ?? this.dataQualityGrade,
    );
  }

  factory CovidStateData.fromMap(Map<String, dynamic> map) {
    return CovidStateData(
      state: map['state'] ?? '',
      date: map['date'] ?? 0,
      death: map['death'] ?? 0,
      deathConfirmed: map['deathConfirmed'] ?? 0,
      deathIncrease: map['deathIncrease'] ?? 0,
      deathProbable: map['deathProbable'] ?? 0,
      hospitalizedCurrently: map['hospitalizedCurrently'] ?? 0,
      hospitalizedCumulative: map['hospitalizedCumulative'] ?? 0,
      hospitalizedIncrease: map['hospitalizedIncrease'] ?? 0,
      inIcuCurrently: map['inIcuCurrently'] ?? 0,
      inIcuCumulative: map['inIcuCumulative'] ?? 0,
      onVentilatorCurrently: map['onVentilatorCurrently'] ?? 0,
      onVentilatorCumulative: map['onVentilatorCumulative'] ?? 0,
      positive: map['positive'] ?? 0,
      positiveCasesViral: map['positiveCasesViral'] ?? 0,
      positiveIncrease: map['positiveIncrease'] ?? 0,
      recovered: map['recovered'] ?? 0,
      totalTestResults: map['totalTestResults'] ?? 0,
      totalTestResultsIncrease: map['totalTestResultsIncrease'] ?? 0,
      lastUpdateEt: map['lastUpdateEt'] ?? '',
      dataQualityGrade: map['dataQualityGrade'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'state': state,
      'date': date,
      'death': death,
      'deathConfirmed': deathConfirmed,
      'deathIncrease': deathIncrease,
      'deathProbable': deathProbable,
      'hospitalizedCurrently': hospitalizedCurrently,
      'hospitalizedCumulative': hospitalizedCumulative,
      'hospitalizedIncrease': hospitalizedIncrease,
      'inIcuCurrently': inIcuCurrently,
      'inIcuCumulative': inIcuCumulative,
      'onVentilatorCurrently': onVentilatorCurrently,
      'onVentilatorCumulative': onVentilatorCumulative,
      'positive': positive,
      'positiveCasesViral': positiveCasesViral,
      'positiveIncrease': positiveIncrease,
      'recovered': recovered,
      'totalTestResults': totalTestResults,
      'totalTestResultsIncrease': totalTestResultsIncrease,
      'lastUpdateEt': lastUpdateEt,
      'dataQualityGrade': dataQualityGrade,
    };
  }

  @override
  List<Object?> get props => [
        state,
        date,
        death,
        deathConfirmed,
        deathIncrease,
        deathProbable,
        hospitalizedCurrently,
        hospitalizedCumulative,
        hospitalizedIncrease,
        inIcuCurrently,
        inIcuCumulative,
        onVentilatorCurrently,
        onVentilatorCumulative,
        positive,
        positiveCasesViral,
        positiveIncrease,
        recovered,
        totalTestResults,
        totalTestResultsIncrease,
        lastUpdateEt,
        dataQualityGrade,
      ];
}
