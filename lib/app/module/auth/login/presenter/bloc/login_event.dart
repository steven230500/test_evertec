part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class ChangeShowPasswordEvent extends LoginEvent {}

class LoginSubmitted extends LoginEvent {}

class UsernameChanged extends LoginEvent {
  final String id;
  const UsernameChanged({
    this.id = '',
  });

  @override
  List<Object> get props => [id];
}

class PasswordChanged extends LoginEvent {
  final String password;
  const PasswordChanged({
    this.password = '',
  });

  @override
  List<Object> get props => [password];
}

class DocumentTypeChanged extends LoginEvent {
  final DocumentType documentType;

  const DocumentTypeChanged({required this.documentType});

  @override
  List<Object> get props => [documentType];
}
