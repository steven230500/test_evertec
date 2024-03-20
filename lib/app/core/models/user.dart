import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String ti;

  const User({
    this.id = '',
    this.ti = '',
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      ti: map['ti'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ti': ti,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      ti,
    ];
  }
}
