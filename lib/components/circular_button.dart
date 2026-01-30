import 'package:drpipou/constants/colors.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final IconData? icon;
  final Color color;
  CircularButton({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
        //     spreadRadius: -1, // Spread of the shadow
        //     blurRadius: 7.8, // How blurry the shadow is
        //     offset: Offset(0, 4), // Shadow position (x, y)
        //   ),
        // ],
        //border: Border.all(color: lightPink),
      ),
      child: Icon(
        icon,
        size: 41,
        color: color,
        shadows: [
          BoxShadow(
            color: const Color.fromARGB(255, 248, 230, 230)
                .withOpacity(0.5), // Shadow color with opacity
            spreadRadius: -1, // Spread of the shadow
            blurRadius: 7.8, // How blurry the shadow is
            offset: Offset(0, 4), // Shadow position (x, y)
          ),
        ],
      ),
    );
  }
}
