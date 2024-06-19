import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:flutter/material.dart';

enum SnackBarType { success, warning, error }

class CustomSnackBar extends StatelessWidget {
  final String message;
  final SnackBarType type;
  const CustomSnackBar({
    super.key,
    required this.message,
    required this.type,
  });

  Color get _color {
    switch (type) {
      case SnackBarType.success:
        return Colors.green;
      case SnackBarType.warning:
        return Colors.orange;
      case SnackBarType.error:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: _color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
