import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color? color;
  final VoidCallback? onPressed;
  final bool? isLoading;

  const CustomFilledButton({
    super.key,
    required this.title,
    this.color,
    this.width = double.infinity,
    this.height = 50,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: isLoading! ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color ?? primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
        ),
        child: isLoading!
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
                ),
              )
            : Text(
                title,
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
      ),
    );
  }
}
