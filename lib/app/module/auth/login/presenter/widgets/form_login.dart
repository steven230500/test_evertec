part of '../page/page.dart';

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
