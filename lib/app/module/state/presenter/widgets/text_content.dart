part of '../page/page.dart';

class TextContent extends StatelessWidget {
  final String text;
  const TextContent({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(height: 1.5),
    );
  }
}
