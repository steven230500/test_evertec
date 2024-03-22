import 'package:equatable/equatable.dart';

class CovidData extends Equatable {
  final int date;
  final int states;
  final int positive;
  final int negative;
  final int? pending;
  final int? hospitalizedCurrently;
  final int? hospitalizedCumulative;
  final int? inIcuCurrently;
  final int? inIcuCumulative;
  final int? onVentilatorCurrently;
  final int? onVentilatorCumulative;
  final String dateChecked;
  final int death;
  final int? hospitalized;
  final int totalTestResults;
  final String lastModified;
  final int? recovered;
  final int deathIncrease;
  final int hospitalizedIncrease;
  final int negativeIncrease;
  final int positiveIncrease;
  final int totalTestResultsIncrease;
  final String hash;

  const CovidData({
    required this.date,
    required this.states,
    required this.positive,
    required this.negative,
    this.pending,
    this.hospitalizedCurrently,
    this.hospitalizedCumulative,
    this.inIcuCurrently,
    this.inIcuCumulative,
    this.onVentilatorCurrently,
    this.onVentilatorCumulative,
    required this.dateChecked,
    required this.death,
    this.hospitalized,
    required this.totalTestResults,
    required this.lastModified,
    this.recovered,
    required this.deathIncrease,
    required this.hospitalizedIncrease,
    required this.negativeIncrease,
    required this.positiveIncrease,
    required this.totalTestResultsIncrease,
    required this.hash,
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        date,
        states,
        positive,
        negative,
        pending,
        hospitalizedCurrently,
        hospitalizedCumulative,
        inIcuCurrently,
        inIcuCumulative,
        onVentilatorCurrently,
        onVentilatorCumulative,
        dateChecked,
        death,
        hospitalized,
        totalTestResults,
        lastModified,
        recovered,
        deathIncrease,
        hospitalizedIncrease,
        negativeIncrease,
        positiveIncrease,
        totalTestResultsIncrease,
        hash,
      ];

  factory CovidData.fromMap(Map<String, dynamic> map) {
    return CovidData(
      date: map['date'],
      states: map['states'],
      positive: map['positive'],
      negative: map['negative'],
      pending: map['pending'],
      hospitalizedCurrently: map['hospitalizedCurrently'],
      hospitalizedCumulative: map['hospitalizedCumulative'],
      inIcuCurrently: map['inIcuCurrently'],
      inIcuCumulative: map['inIcuCumulative'],
      onVentilatorCurrently: map['onVentilatorCurrently'],
      onVentilatorCumulative: map['onVentilatorCumulative'],
      dateChecked: map['dateChecked'],
      death: map['death'],
      hospitalized: map['hospitalized'],
      totalTestResults: map['totalTestResults'],
      lastModified: map['lastModified'],
      recovered: map['recovered'],
      deathIncrease: map['deathIncrease'],
      hospitalizedIncrease: map['hospitalizedIncrease'],
      negativeIncrease: map['negativeIncrease'],
      positiveIncrease: map['positiveIncrease'],
      totalTestResultsIncrease: map['totalTestResultsIncrease'],
      hash: map['hash'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'states': states,
      'positive': positive,
      'negative': negative,
      'pending': pending,
      'hospitalizedCurrently': hospitalizedCurrently,
      'hospitalizedCumulative': hospitalizedCumulative,
      'inIcuCurrently': inIcuCurrently,
      'inIcuCumulative': inIcuCumulative,
      'onVentilatorCurrently': onVentilatorCurrently,
      'onVentilatorCumulative': onVentilatorCumulative,
      'dateChecked': dateChecked,
      'death': death,
      'hospitalized': hospitalized,
      'totalTestResults': totalTestResults,
      'lastModified': lastModified,
      'recovered': recovered,
      'deathIncrease': deathIncrease,
      'hospitalizedIncrease': hospitalizedIncrease,
      'negativeIncrease': negativeIncrease,
      'positiveIncrease': positiveIncrease,
      'totalTestResultsIncrease': totalTestResultsIncrease,
      'hash': hash,
    };
  }

  CovidData copyWith({
    int? date,
    int? states,
    int? positive,
    int? negative,
    int? pending,
    int? hospitalizedCurrently,
    int? hospitalizedCumulative,
    int? inIcuCurrently,
    int? inIcuCumulative,
    int? onVentilatorCurrently,
    int? onVentilatorCumulative,
    String? dateChecked,
    int? death,
    int? hospitalized,
    int? totalTestResults,
    String? lastModified,
    int? recovered,
    int? total,
    int? posNeg,
    int? deathIncrease,
    int? hospitalizedIncrease,
    int? negativeIncrease,
    int? positiveIncrease,
    int? totalTestResultsIncrease,
    String? hash,
  }) {
    return CovidData(
      date: date ?? this.date,
      states: states ?? this.states,
      positive: positive ?? this.positive,
      negative: negative ?? this.negative,
      pending: pending ?? this.pending,
      hospitalizedCurrently: hospitalizedCurrently ?? this.hospitalizedCurrently,
      hospitalizedCumulative: hospitalizedCumulative ?? this.hospitalizedCumulative,
      inIcuCurrently: inIcuCurrently ?? this.inIcuCurrently,
      inIcuCumulative: inIcuCumulative ?? this.inIcuCumulative,
      onVentilatorCurrently: onVentilatorCurrently ?? this.onVentilatorCurrently,
      onVentilatorCumulative: onVentilatorCumulative ?? this.onVentilatorCumulative,
      dateChecked: dateChecked ?? this.dateChecked,
      death: death ?? this.death,
      hospitalized: hospitalized ?? this.hospitalized,
      totalTestResults: totalTestResults ?? this.totalTestResults,
      lastModified: lastModified ?? this.lastModified,
      recovered: recovered ?? this.recovered,
      deathIncrease: deathIncrease ?? this.deathIncrease,
      hospitalizedIncrease: hospitalizedIncrease ?? this.hospitalizedIncrease,
      negativeIncrease: negativeIncrease ?? this.negativeIncrease,
      positiveIncrease: positiveIncrease ?? this.positiveIncrease,
      totalTestResultsIncrease: totalTestResultsIncrease ?? this.totalTestResultsIncrease,
      hash: hash ?? this.hash,
    );
  }

  factory CovidData.empty() {
    return const CovidData(
      date: 0,
      states: 0,
      positive: 0,
      negative: 0,
      pending: null,
      hospitalizedCurrently: null,
      hospitalizedCumulative: null,
      inIcuCurrently: null,
      inIcuCumulative: null,
      onVentilatorCurrently: null,
      onVentilatorCumulative: null,
      dateChecked: '',
      death: 0,
      hospitalized: null,
      totalTestResults: 0,
      lastModified: '',
      recovered: null,
      deathIncrease: 0,
      hospitalizedIncrease: 0,
      negativeIncrease: 0,
      positiveIncrease: 0,
      totalTestResultsIncrease: 0,
      hash: '',
    );
  }
}
