import 'package:flutter/material.dart';

class Loading {
  static void show(
    BuildContext context, {
    bool useRootNavigator = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: useRootNavigator,
      builder: (_) {
        return const PopScope(
          canPop: false,
          child: LoadingWidget(),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.pop(context);
  }
}

class LoadingWidget extends StatelessWidget {
  final double height;
  final double width;
  const LoadingWidget({
    super.key,
    this.height = 80.0,
    this.width = 80.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: const CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 4.0,
        ),
      ),
    );
  }
}
