import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _View();
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/login.webp',
              width: double.infinity,
            ),
            const FormLogin(),
          ],
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
          const InputLogin(label: 'Tipo Documento'),
          const SizedBox(height: 15),
          const InputLogin(label: 'Número Documento'),
          const SizedBox(height: 15),
          const InputLogin(label: 'Contraseña'),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: const Size(double.infinity, 40),
            ),
            child: const Text('Login'),
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Registrar Usuario',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espacia los botones uniformemente
            children: [
              // Botón de Google
              IconButton(
                icon: const Icon(Icons.g_mobiledata), // Icono representativo de Google
                color: Colors.blue, // Color representativo
                onPressed: () {
                  // Acción para Google
                },
              ),
              // Botón de Facebook
              IconButton(
                icon: const Icon(Icons.facebook), // Utiliza FontAwesome para Facebook
                color: Colors.blueAccent, // Color representativo
                onPressed: () {
                  // Acción para Facebook
                },
              ),
              // Botón de Instagram (alternativa)
              IconButton(
                icon: const Icon(
                    Icons.camera_alt), // Icono alternativo que podría representar Instagram
                color: Colors.pink, // Color representativo
                onPressed: () {
                  // Acción para Instagram
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InputLogin extends StatelessWidget {
  final String label;
  const InputLogin({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(label),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(15.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(15.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(15.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ],
    );
  }
}
