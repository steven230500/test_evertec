import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_evertec/app/core/models/failure.dart';
import 'package:test_evertec/app/module/auth/login/domain/dto/usecase.dart';
import 'package:test_evertec/app/module/auth/login/presenter/utils/validations.dart';
import 'package:test_evertec/app/module/auth/login/repository/repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(const LoginInitial(Model())) {
    on<ChangeShowPasswordEvent>(_onChangeShowPassword);
    on<UsernameChanged>(_onUsernameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<DocumentTypeChanged>(_onDocumentTypeChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoadingState(state.model));
    final result = await loginRepository.fetchUsers();
    result.match((userRequestDTOs) {
      final currentUser = state.model.userRequestDTO;
      if (userRequestDTOs.any((storedUser) =>
          storedUser.id == currentUser.id &&
          storedUser.password == currentUser.password &&
          storedUser.documentType == currentUser.documentType)) {
        emit(LoadedState(state.model));
      } else {
        emit(
          ErrorState(
            state.model,
            error: const Failure('Credenciales incorrectas'),
          ),
        );
      }
    },
        (err) => emit(
              ErrorState(
                state.model,
                error: Failure(err),
              ),
            ));
  }

  void _onDocumentTypeChanged(
    DocumentTypeChanged event,
    Emitter<LoginState> emit,
  ) {
    final userDto = state.model.userRequestDTO.copyWith(
      documentType: event.documentType,
    );
    emit(
      ValidateState(
        state.model.copyWith(
          userRequestDTO: userDto,
        ),
      ),
    );
  }

  void _onChangeShowPassword(
    ChangeShowPasswordEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(
      ChangedShowPasswordState(
        state.model.copyWith(
          showPassword: !state.model.showPassword,
        ),
      ),
    );
  }

  void _onUsernameChanged(UsernameChanged event, Emitter<LoginState> emit) {
    final isValidEmail = isEmailValid(event.id);
    final userDto = state.model.userRequestDTO.copyWith(
      id: event.id,
    );

    emit(
      ValidateState(
        state.model.copyWith(
          userRequestDTO: userDto,
          isEmailValid: isValidEmail,
        ),
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final isValidPassword = isPasswordValid(event.password);
    final userDto = state.model.userRequestDTO.copyWith(
      password: event.password,
    );

    emit(
      ValidateState(
        state.model.copyWith(
          userRequestDTO: userDto,
          isPasswordValid: isValidPassword,
        ),
      ),
    );
  }
}
