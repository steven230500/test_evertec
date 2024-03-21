// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

enum DocumentType { CC, TI, NIT }

class UserRequestDTO extends Equatable {
  final String id;
  final String password;
  final DocumentType documentType;

  const UserRequestDTO({
    this.id = '',
    this.password = '',
    this.documentType = DocumentType.CC,
  });

  UserRequestDTO copyWith({
    String? id,
    String? password,
    DocumentType? documentType,
  }) {
    return UserRequestDTO(
      id: id ?? this.id,
      password: password ?? this.password,
      documentType: documentType ?? this.documentType,
    );
  }

  factory UserRequestDTO.fromMap(Map<String, dynamic> map) {
    return UserRequestDTO(
      id: map['id'] ?? '',
      password: map['password'] ?? '',
      documentType: DocumentType.values.firstWhere(
        (e) => e.name == map['td'],
        orElse: () => DocumentType.CC,
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'password': password,
      'documentType': documentType.name,
    };
  }

  @override
  List<Object?> get props => [id, password, documentType];
}
