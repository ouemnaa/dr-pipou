import 'package:drpipou/constants/colors.dart';
import 'package:flutter/material.dart';

class RectangularChoice extends StatelessWidget {
  final String choice;
  final Color color;
  final void Function()? onTap;
  bool isClicked = false;
  RectangularChoice({
    super.key,
    required this.choice,
    required this.color,
    required this.onTap,
    required this.isClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(11),
            border: Border.all(
              color: isClicked ? lightPink : Colors.white,
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 23, right: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  choice,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                isClicked
                    ? Icon(
                        Icons.done_outlined,
                        color: color,
                      )
                    : Text(""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
