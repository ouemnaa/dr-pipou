import 'dart:io';

import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/circular_button.dart';
import 'package:drpipou/components/my_text_button.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class PicDetection extends StatefulWidget {
  final Color writingColor;
  final Color feelColor;
  final void Function()? onTap;
  PicDetection({
    super.key,
    required this.writingColor,
    required this.feelColor,
    required this.onTap,
  });

  @override
  State<PicDetection> createState() => _PicDetectionState();
}

class _PicDetectionState extends State<PicDetection> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print("failed");
    }
  }

  Future takeImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print("failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 360,
              height: 500,
              decoration: BoxDecoration(
                border: Border.all(color: widget.feelColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: image == null
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Please take a picture or choose a mamography.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Image.asset(
                          //     "assets/images/pipou_in_action/kitty_blh.png"),
                          Text(
                            "We will take care of the rest.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    )
                  : Image.file(
                      image!,
                      // width: 300,
                      //height: 400,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: takeImage,
                  child: CircularButton(
                    icon: Icons.camera_alt,
                    color: widget.feelColor,
                  ),
                ),
                GestureDetector(
                  onTap: pickImage,
                  child: CircularButton(
                    icon: Icons.image,
                    color: widget.feelColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            image != null
                ? ActionButton(
                    color: widget.writingColor,
                    textAction: "get diagnosis",
                    onTap: () {})
                : Text(""),
            MyTextButton(
                onTap: widget.onTap,
                writingColor: widget.writingColor,
                text: "go back")
          ],
        ),
      ),
    );
  }
}
