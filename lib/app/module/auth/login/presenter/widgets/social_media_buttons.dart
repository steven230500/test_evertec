import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_evertec/app/module/auth/login/presenter/utils/alert.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(FontAwesomeIcons.google),
          color: Colors.blue,
          onPressed: () => showAlert(context, 'Google'),
        ),
        IconButton(
          icon: const Icon(FontAwesomeIcons.facebook),
          color: Colors.blueAccent,
          onPressed: () => showAlert(context, 'Facebook'),
        ),
        IconButton(
          icon: const Icon(FontAwesomeIcons.instagram),
          color: Colors.pink,
          onPressed: () => showAlert(context, 'Instagram'),
        ),
      ],
    );
  }
}
