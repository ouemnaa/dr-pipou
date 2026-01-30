import 'package:drpipou/constants/colors.dart';
import 'package:flutter/material.dart';

class BottomMessage extends StatelessWidget {
  final Color color;
  BottomMessage({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: backgroundColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "made with lots of ",
                style: TextStyle(color: gray),
              ),
              Icon(
                Icons.favorite,
                color: color,
                size: 15,
              ),
              // Text(
              //   " from mind install team",
              //   style: TextStyle(color: gray),
              // ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.rectangle_rounded,
                size: 10,
                color: Colors.red,
              ),
              Icon(
                Icons.rectangle_rounded,
                size: 10,
                color: Colors.black,
              ),
              Icon(
                Icons.rectangle_rounded,
                size: 10,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              Icon(
                Icons.rectangle_rounded,
                size: 10,
                color: const Color.fromARGB(187, 76, 175, 79),
              ),
            ],
          )
        ],
      ),
    );
  }
}
