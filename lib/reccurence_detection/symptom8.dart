import 'package:drpipou/Data/user_data.dart';
import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/my_text_button.dart';
import 'package:drpipou/components/rectangular_choice.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/constants/symptom_lists.dart';
import 'package:drpipou/pages/symptom_detection.dart';
import 'package:drpipou/patient_interface/patient_home.dart';
import 'package:drpipou/reccurence_detection/symptom7.dart';
import 'package:drpipou/reccurence_detection/symptom9.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Symptom8 extends StatefulWidget {
  const Symptom8({super.key});

  @override
  State<Symptom8> createState() => _Symptom8State();
}

class _Symptom8State extends State<Symptom8> {
  @override
  void initState() {
    super.initState();
    if (_userSymptomsBox.get("usersSymptoms") != null) {
      db.loadAll();
    }
  }

  final _userSymptomsBox = Hive.box('usersymptoms');
  UserData db = UserData();
  bool answered = false;
  bool clickYes = false;
  bool clickNo = false;
  void onTapYes() {
    setState(() {
      if (clickYes == false) {
        clickYes = true;
        clickNo = false;
        answered = true;
      }
    });
  }

  void onTapNo() {
    setState(() {
      if (clickNo == false) {
        clickNo = true;
        clickYes = false;
        answered = true;
      }
    });
  }

  final index = 7;
  final num = 6;
  void previousQuestion() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SymptomDetection(
                color: lightPink,
                symptomNum: num - 1,
                totalSymptoms: 8,
                symptomName: "Affected quadrant",
                symptomDescription:
                    "Please select the affected quadrant of the breast.",
                progress: num - 2,
                child: Symptom7(),
              )),
    );
  }

  int getResult() {
    if (clickNo == true) {
      return 0;
    } else {
      return 1;
    }
  }

  void nextQuestion() {
    db.loadAll();
    int res = getResult();
    db.userSymptoms += [res];
    db.updateAll();
    print(db.userSymptoms);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SymptomDetection(
                color: lightPink,
                symptomNum: num + 1,
                totalSymptoms: 9,
                symptomName: "Age",
                symptomDescription: "Please state your age range",
                progress: 6,
                child: Symptom9(),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 85.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              RectangularChoice(
                  choice: "Yes",
                  color: lightPink,
                  onTap: onTapYes,
                  isClicked: clickYes),
              const SizedBox(
                height: 29,
              ),
              RectangularChoice(
                choice: "No",
                color: lightPink,
                onTap: onTapNo,
                isClicked: clickNo,
              ),
            ],
          ),
          answered
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ActionButton(
                            color: darkPink,
                            textAction: "next question",
                            onTap: nextQuestion,
                          ),
                          MyTextButton(
                            onTap: previousQuestion,
                            writingColor: darkPink,
                            text: "previous question",
                          ),
                        ],
                      )),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyTextButton(
                            onTap: previousQuestion,
                            writingColor: darkPink,
                            text: "previous question"),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
