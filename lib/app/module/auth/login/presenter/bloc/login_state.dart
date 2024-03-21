part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  final Model model;

  const LoginState(this.model);

  @override
  List<Object> get props => [model];
}

final class LoginInitial extends LoginState {
  const LoginInitial(super.model);
}

class ChangedShowPasswordState extends LoginState {
  const ChangedShowPasswordState(super.model);
}

class ValidateState extends LoginState {
  const ValidateState(super.model);
}

final class ErrorState extends LoginState {
  final Failure error;

  const ErrorState(super.model, {required this.error});
}

final class LoadingState extends LoginState {
  const LoadingState(super.model);
}

final class LoadedState extends LoginState {
  const LoadedState(super.model);
}

class Model extends Equatable {
  final bool showPassword;
  final bool isPasswordValid;
  final bool isEmailValid;

  final UserRequestDTO userRequestDTO;

  const Model({
    this.showPassword = false,
    this.isPasswordValid = false,
    this.isEmailValid = false,
    this.userRequestDTO = const UserRequestDTO(),
  });

  Model copyWith({
    bool? showPassword,
    bool? isPasswordValid,
    bool? isEmailValid,
    UserRequestDTO? userRequestDTO,
  }) {
    return Model(
      showPassword: showPassword ?? this.showPassword,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      userRequestDTO: userRequestDTO ?? this.userRequestDTO,
    );
  }

  @override
  List<Object?> get props {
    return [
      userRequestDTO,
      showPassword,
      isEmailValid,
      isPasswordValid,
    ];
  }
}
