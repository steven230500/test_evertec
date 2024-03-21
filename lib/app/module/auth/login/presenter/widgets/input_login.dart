part of '../page/page.dart';

class InputLogin extends StatelessWidget {
  final String label;
  final void Function(String)? onChanged;
  final bool isPasswordField;
  final bool showPassword;

  const InputLogin({
    super.key,
    required this.label,
    this.onChanged,
    this.isPasswordField = false,
    this.showPassword = false,
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
          validator: notEmptyValidator,
          obscureText: isPasswordField && !showPassword,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(15.0),
            ),
            suffixIcon: isPasswordField
                ? IconButton(
                    icon: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Modular.get<LoginBloc>().add(ChangeShowPasswordEvent());
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
