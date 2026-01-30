import 'package:drpipou/Data/user_data.dart';
import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/circular_choice.dart';
import 'package:drpipou/components/my_text_button.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/constants/symptom_lists.dart';
import 'package:drpipou/pages/symptom_detection.dart';
import 'package:drpipou/reccurence_detection/symptom5.dart';
import 'package:drpipou/reccurence_detection/symptom7.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Symptom6 extends StatefulWidget {
  const Symptom6({super.key});

  @override
  State<Symptom6> createState() => _Symptom6State();
}

class _Symptom6State extends State<Symptom6> {
  @override
  void initState() {
    super.initState();
    if (_userSymptomsBox.get("usersSymptoms") != null) {
      db.loadAll();
    }
  }

  final _userSymptomsBox = Hive.box('usersymptoms');
  UserData db = UserData();
  bool clickLeft = false;
  bool clickRight = false;
  bool answered = false;
  void onTapLeft() {
    setState(() {
      if (clickLeft == false) {
        clickLeft = true;
        clickRight = false;
        answered = true;
      }
    });
  }

  void onTapRight() {
    setState(() {
      if (clickRight == false) {
        clickRight = true;
        clickLeft = false;
        answered = true;
      }
    });
  }

  //final index = 5;
  final num = 4;
  void previousQuestion() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SymptomDetection(
                color: lightPink,
                symptomNum: num - 1,
                totalSymptoms: 8,
                symptomName: "Degree of Maligancy",
                symptomDescription:
                    "Please state the degree of maligancy (severety of the tumor)",
                progress: num - 2,
                child: Symptom5(),
              )),
    );
  }

  int getIndex() {
    if (clickRight == true) {
      return 0;
    } else {
      return 1;
    }
  }

  void nextQuestion() {
    db.loadAll();
    int res = getIndex();
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
                symptomName: "Affected quadrant",
                symptomDescription:
                    "Please select the affected quadrant of the breast.",
                progress: 4,
                child: Symptom7(),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Stack(
        //alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularChoice(
                h: 100,
                w: 100,
                value: "Left",
                onTap: onTapLeft,
                isClicked: clickLeft,
                visible: true,
              ),
              const SizedBox(
                width: 35,
              ),
              CircularChoice(
                h: 100,
                w: 100,
                value: "Right",
                onTap: onTapRight,
                isClicked: clickRight,
                visible: true,
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
