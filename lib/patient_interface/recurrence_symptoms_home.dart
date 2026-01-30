import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/my_text_button.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/pages/symptom_detection.dart';
import 'package:drpipou/patient_interface/patient_home.dart';
import 'package:drpipou/reccurence_detection/symptom1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecurrenceSymptomsHome extends StatelessWidget {
  int index = 0;
  final totalSymptoms = 8;

  RecurrenceSymptomsHome({super.key});

  @override
  Widget build(BuildContext context) {
    void startDiagnosis() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SymptomDetection(
                  color: lightPink,
                  symptomNum: index + 1,
                  totalSymptoms: 9,
                  symptomName: recSymptoms[index][0],
                  symptomDescription: recSymptoms[index][1],
                  progress: 0,
                  child: Symptom1(),
                )),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: SvgPicture.asset(
                      "assets/images/others/kitty_giving_diagnosis_pink.svg"),
                ),
              ),
              color: lightPink,
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
                      Row(
                        children: [
                          Text(
                            "This form is for ",
                            style: TextStyle(
                              fontSize: 14,
                              color: gray,
                            ),
                          ),
                          Text(
                            "detecting recurrence",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: gray,
                            ),
                          ),
                          Text(
                            ".",
                            style: TextStyle(
                              fontSize: 14,
                              color: gray,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "If you have no history of breast cancer this will not be of help. ",
                        style: TextStyle(
                          fontSize: 14,
                          color: gray,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          ActionButton(
                            color: darkPink,
                            textAction: 'start',
                            onTap: startDiagnosis,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          MyTextButton(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PatientHome()),
                                );
                              },
                              writingColor: darkPink,
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
