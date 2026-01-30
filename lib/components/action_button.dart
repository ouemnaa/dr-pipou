import 'package:drpipou/constants/colors.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Color color;
  final String textAction;
  final void Function()? onTap;

  ActionButton({
    super.key,
    required this.color,
    required this.textAction,
    required this.onTap,
  });
//normal width is 286 for doc we will use
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(11),
        ),
        width: 286,
        height: 46,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 67, right: 67, top: 8, bottom: 10),
          child: Text(
            textAction,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: backgroundColor),
          ),
        ),
      ),
    );
  }
}
