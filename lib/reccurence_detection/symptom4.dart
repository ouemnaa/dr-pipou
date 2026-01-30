import 'package:drpipou/Data/user_data.dart';
import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/my_text_button.dart';
import 'package:drpipou/components/rectangular_choice.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/constants/symptom_lists.dart';
import 'package:drpipou/pages/symptom_detection.dart';
import 'package:drpipou/reccurence_detection/symptom1.dart';
import 'package:drpipou/reccurence_detection/symptom5.dart';
import 'package:drpipou/reccurence_detection/symptom7.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Symptom4 extends StatefulWidget {
  const Symptom4({super.key});

  @override
  State<Symptom4> createState() => _Symptom4State();
}

class _Symptom4State extends State<Symptom4> {
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

  final index = 1;
  final num = 2;
  void previousQuestion() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SymptomDetection(
                color: lightPink,
                symptomNum: num - 1,
                totalSymptoms: 8,
                symptomName: "Menopause",
                symptomDescription: "",
                progress: num - 2,
                child: Symptom1(),
              )),
    );
  }

  int getresult() {
    if (clickYes == true) {
      return 0;
    } else {
      return 1;
    }
  }

  void nextQuestion() {
    db.loadAll();
    int res = getresult();
    db.userSymptoms += [res];
    db.updateAll();
    print(db.userSymptoms);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SymptomDetection(
                color: lightPink,
                symptomNum: 3,
                totalSymptoms: 9,
                symptomName: "Degree of Maligancy",
                symptomDescription:
                    "Please state the degree of maligancy (severety of the tumor)",
                progress: 2,
                child: Symptom5(),
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
