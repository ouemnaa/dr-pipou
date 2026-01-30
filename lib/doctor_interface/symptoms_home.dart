import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/my_text_button.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/doctor_detection/detection_first_page.dart';
import 'package:drpipou/doctor_interface/symptom_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SymptomsHome extends StatelessWidget {
  const SymptomsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 500,
              // child: Padding(
              //   padding: const EdgeInsets.all(0),
              //   child: Align(
              //     alignment: AlignmentDirectional.bottomCenter,
              //     child: SvgPicture.asset(
              //         "assets/images/others/kitty_giving_diagnosis_pink.svg"),
              //   ),
              // ),
              color: lightBlue,
            ),
            Expanded(
              child: Container(
                color: backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    left: 21,
                    right: 21,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Fill out the questionnaire",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "This will help you diagnose your patients !",
                        style: TextStyle(
                          fontSize: 14,
                          color: gray,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Column(
                        children: [
                          ActionButton(
                            color: lightBlue,
                            textAction: 'start',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SymptomMain(
                                    valuesToFill: 'Average Values',
                                    page: 'page 1',
                                    child: DetectionFirstPage(),
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          MyTextButton(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              writingColor: lightBlue,
                              text: "go back"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
