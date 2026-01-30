import 'package:flutter/material.dart';

class YesNoButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  YesNoButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80, // Set width
        height: 80, // Set height
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 25),
        )),
      ),
    );
  }
}
