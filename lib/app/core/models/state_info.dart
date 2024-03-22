import 'package:equatable/equatable.dart';

class StateInfo extends Equatable {
  final String covid19Site;
  final String covid19SiteOld;
  final String covid19SiteQuaternary;
  final String covid19SiteQuinary;
  final String covid19SiteSecondary;
  final String covid19SiteTertiary;
  final String covidTrackingProjectPreferredTotalTestField;
  final String covidTrackingProjectPreferredTotalTestUnits;
  final String fips;
  final String name;
  final String notes;
  final String state;
  final String totalTestResultsField;
  final String twitter;

  const StateInfo({
    required this.covid19Site,
    required this.covid19SiteOld,
    required this.covid19SiteQuaternary,
    required this.covid19SiteQuinary,
    required this.covid19SiteSecondary,
    required this.covid19SiteTertiary,
    required this.covidTrackingProjectPreferredTotalTestField,
    required this.covidTrackingProjectPreferredTotalTestUnits,
    required this.fips,
    required this.name,
    required this.notes,
    required this.state,
    required this.totalTestResultsField,
    required this.twitter,
  });

  StateInfo copyWith({
    String? covid19Site,
    String? covid19SiteOld,
    String? covid19SiteQuaternary,
    String? covid19SiteQuinary,
    String? covid19SiteSecondary,
    String? covid19SiteTertiary,
    String? covidTrackingProjectPreferredTotalTestField,
    String? covidTrackingProjectPreferredTotalTestUnits,
    String? fips,
    String? name,
    String? notes,
    String? state,
    String? totalTestResultsField,
    String? twitter,
  }) {
    return StateInfo(
      covid19Site: covid19Site ?? this.covid19Site,
      covid19SiteOld: covid19SiteOld ?? this.covid19SiteOld,
      covid19SiteQuaternary: covid19SiteQuaternary ?? this.covid19SiteQuaternary,
      covid19SiteQuinary: covid19SiteQuinary ?? this.covid19SiteQuinary,
      covid19SiteSecondary: covid19SiteSecondary ?? this.covid19SiteSecondary,
      covid19SiteTertiary: covid19SiteTertiary ?? this.covid19SiteTertiary,
      covidTrackingProjectPreferredTotalTestField: covidTrackingProjectPreferredTotalTestField ??
          this.covidTrackingProjectPreferredTotalTestField,
      covidTrackingProjectPreferredTotalTestUnits: covidTrackingProjectPreferredTotalTestUnits ??
          this.covidTrackingProjectPreferredTotalTestUnits,
      fips: fips ?? this.fips,
      name: name ?? this.name,
      notes: notes ?? this.notes,
      state: state ?? this.state,
      totalTestResultsField: totalTestResultsField ?? this.totalTestResultsField,
      twitter: twitter ?? this.twitter,
    );
  }

  factory StateInfo.fromMap(Map<String, dynamic> map) {
    return StateInfo(
      covid19Site: map['covid19Site'] ?? '',
      covid19SiteOld: map['covid19SiteOld'] ?? '',
      covid19SiteQuaternary: map['covid19SiteQuaternary'] ?? '',
      covid19SiteQuinary: map['covid19SiteQuinary'] ?? '',
      covid19SiteSecondary: map['covid19SiteSecondary'] ?? '',
      covid19SiteTertiary: map['covid19SiteTertiary'] ?? '',
      covidTrackingProjectPreferredTotalTestField:
          map['covidTrackingProjectPreferredTotalTestField'] ?? '',
      covidTrackingProjectPreferredTotalTestUnits:
          map['covidTrackingProjectPreferredTotalTestUnits'] ?? '',
      fips: map['fips'] ?? '',
      name: map['name'] ?? '',
      notes: map['notes'] ?? '',
      state: map['state'] ?? '',
      totalTestResultsField: map['totalTestResultsField'] ?? '',
      twitter: map['twitter'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'covid19Site': covid19Site,
      'covid19SiteOld': covid19SiteOld,
      'covid19SiteQuaternary': covid19SiteQuaternary,
      'covid19SiteQuinary': covid19SiteQuinary,
      'covid19SiteSecondary': covid19SiteSecondary,
      'covid19SiteTertiary': covid19SiteTertiary,
      'covidTrackingProjectPreferredTotalTestField': covidTrackingProjectPreferredTotalTestField,
      'covidTrackingProjectPreferredTotalTestUnits': covidTrackingProjectPreferredTotalTestUnits,
      'fips': fips,
      'name': name,
      'notes': notes,
      'state': state,
      'totalTestResultsField': totalTestResultsField,
      'twitter': twitter,
    };
  }

  @override
  List<Object?> get props => [
        covid19Site,
        covid19SiteOld,
        covid19SiteQuaternary,
        covid19SiteQuinary,
        covid19SiteSecondary,
        covid19SiteTertiary,
        covidTrackingProjectPreferredTotalTestField,
        covidTrackingProjectPreferredTotalTestUnits,
        fips,
        name,
        notes,
        state,
        totalTestResultsField,
        twitter
      ];
}
