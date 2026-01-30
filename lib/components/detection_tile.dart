import 'package:drpipou/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetectionTile extends StatelessWidget {
  final String icon_path;
  final String detection_type;
  final String sub_text;
  final Color color;
  final void Function()? onTap;
  DetectionTile({
    super.key,
    required this.icon_path,
    required this.detection_type,
    required this.sub_text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: backgroundColor,
          border: Border.all(color: color, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
              spreadRadius: -1, // Spread of the shadow
              blurRadius: 7.8, // How blurry the shadow is
              offset: Offset(0, 4), // Shadow position (x, y)
            ),
          ],
        ),
        height: 88,
        width: 313,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon_path,
              height: 64,
              width: 39,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detection_type,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                Text(
                  sub_text,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: gray,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
