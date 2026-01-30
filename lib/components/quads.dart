import 'package:drpipou/constants/colors.dart';
import 'package:flutter/material.dart';

class Quads extends StatelessWidget {
  final String text1;
  final String text2;
  final int quadNum;
  final void Function()? onTap;
  bool isClicked = false;
  Quads({
    super.key,
    required this.quadNum,
    required this.text1,
    required this.text2,
    required this.onTap,
    required this.isClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 120,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: quadNum != 0
                ? [
                    Text(
                      text1,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      text2,
                      style: TextStyle(fontSize: 18),
                    )
                  ]
                : [
                    Text(
                      text1,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: isClicked ? lightPink : Colors.white,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: quadNum == 1
              ? const BorderRadius.only(
                  topLeft: Radius.circular(120),
                )
              : quadNum == 2
                  ? const BorderRadius.only(
                      topRight: Radius.circular(120),
                    )
                  : quadNum == 3
                      ? const BorderRadius.only(
                          bottomLeft: Radius.circular(120),
                        )
                      : quadNum == 4
                          ? const BorderRadius.only(
                              bottomRight: Radius.circular(120),
                            )
                          : const BorderRadius.all(
                              Radius.circular(100),
                            ),
        ),
      ),
    );
  }
}
