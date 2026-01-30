import 'package:drpipou/constants/colors.dart';
import 'package:flutter/material.dart';

class CircularChoice extends StatelessWidget {
  final String value;
  final void Function()? onTap;
  final double? h;
  final double? w;
  final bool visible;
  bool isClicked = false;
  CircularChoice({
    super.key,
    required this.value,
    required this.onTap,
    required this.isClicked,
    required this.h,
    required this.w,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: AlignmentDirectional.center,
        height: h,
        width: w,
        decoration: BoxDecoration(
          border: Border.all(
            color: visible
                ? isClicked
                    ? lightPink
                    : Colors.white
                : backgroundColor,
            width: 3,
          ),
          shape: BoxShape.circle,
          color: visible ? Colors.white : backgroundColor,
          boxShadow: visible
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
