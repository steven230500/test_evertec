import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_evertec/app/core/utils/loading.dart';
import 'package:test_evertec/app/module/auth/login/domain/dto/usecase.dart';
import 'package:test_evertec/app/module/auth/login/presenter/bloc/login_bloc.dart';
import 'package:test_evertec/app/module/auth/login/presenter/utils/alert.dart';
import 'package:test_evertec/app/module/auth/login/presenter/utils/validations.dart';
import 'package:test_evertec/app/module/auth/login/presenter/widgets/select_form_field.dart';
import 'package:test_evertec/app/module/auth/login/presenter/widgets/social_media_buttons.dart';

part '../widgets/input_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<LoginBloc>(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    const animationDuration = Duration(milliseconds: 300);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoadingState) {
            Loading.show(context);
          }
          if (state is LoadedState) {
            Loading.hide(context);
            Modular.to.navigate('/home');
          }
          if (state is ErrorState) {
            Loading.hide(context);
            showAlert(context, state.error.message);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              FadeInDown(
                duration: animationDuration,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      'assets/images/login.webp',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0, bottom: 5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bienvenido a:',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Evertec',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FadeInDown(
                duration: animationDuration,
                child: const FormLogin(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          SelectFormField(
            label: 'Tipo Documento',
            options: DocumentType.values.map((e) => e.name).toList(),
            onChanged: (value) {
              final selectedDocumentType = DocumentType.values.firstWhere((e) => e.name == value);
              Modular.get<LoginBloc>().add(DocumentTypeChanged(documentType: selectedDocumentType));
            },
          ),
          const SizedBox(height: 15),
          InputLogin(
            label: 'Número Documento',
            onChanged: (value) {
              Modular.get<LoginBloc>().add(UsernameChanged(id: value));
            },
          ),
          const SizedBox(height: 15),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return InputLogin(
                label: 'Contraseña',
                isPasswordField: true,
                showPassword: state.model.showPassword,
                onChanged: (value) {
                  Modular.get<LoginBloc>().add(PasswordChanged(password: value));
                },
              );
            },
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Modular.get<LoginBloc>().add(LoginSubmitted());
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: const Size(double.infinity, 40),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton(
              onPressed: () => showAlert(context, 'Registrar Usuario'),
              child: const Text(
                'Registrar Usuario',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SocialMediaButtons(),
        ],
      ),
    );
  }
}
