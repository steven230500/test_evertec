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
part '../widgets/form_login.dart';

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
