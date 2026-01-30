import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color writingColor;
  MyTextButton({
    super.key,
    required this.onTap,
    required this.writingColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: writingColor,
        ),
      ),
    );
  }
}
