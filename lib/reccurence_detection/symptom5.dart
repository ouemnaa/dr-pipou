import 'package:drpipou/Data/user_data.dart';
import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/my_text_button.dart';
import 'package:drpipou/components/rectangular_choice.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/constants/symptom_lists.dart';
import 'package:drpipou/pages/symptom_detection.dart';
import 'package:drpipou/reccurence_detection/symptom4.dart';
import 'package:drpipou/reccurence_detection/symptom6.dart';
import 'package:drpipou/reccurence_detection/symptom8.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Symptom5 extends StatefulWidget {
  const Symptom5({super.key});

  @override
  State<Symptom5> createState() => _Symptom5State();
}

class _Symptom5State extends State<Symptom5> {
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
  List<bool> isClicked = List.filled(3, false);
  void onTap(index) {
    setState(() {
      if (isClicked[index] == false) {
        isClicked.fillRange(0, isClicked.length, false);
        isClicked[index] = true;
        answered = true;
      }
    });
  }

  final index = 2;
  final num = 3;
  void previousQuestion() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SymptomDetection(
                color: lightPink,
                symptomNum: num - 1,
                totalSymptoms: 9,
                symptomName: "Node Caps",
                symptomDescription:
                    "Have any  of the nodes shown capsular invasion ?",
                progress: num - 2,
                child: Symptom4(),
              )),
    );
  }

// symptomName: "Irradiate",
//                 symptomDescription:
//                     "Have you recieved any radiation treatments ?",
//                 progress: num - 2,
//                 child: Symptom8(),
  int getClickedIndex() {
    int index = -1;
    for (int i = 0; i < isClicked.length; i++) {
      if (isClicked[i] == true) {
        index = i;
        break;
      }
    }

    return index++;
  }

  void nextQuestion() {
    db.loadAll();
    int res = getClickedIndex();
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
                symptomName: "Affected Breast",
                symptomDescription: "Which breast is affected ?",
                progress: 3,
                child: Symptom6(),
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
                choice: "Low",
                color: lightPink,
                onTap: () {
                  onTap(0);
                },
                isClicked: isClicked[0],
              ),
              const SizedBox(
                height: 29,
              ),
              RectangularChoice(
                choice: "Medium",
                color: lightPink,
                onTap: () {
                  onTap(1);
                },
                isClicked: isClicked[1],
              ),
              const SizedBox(
                height: 29,
              ),
              RectangularChoice(
                choice: "High",
                color: lightPink,
                onTap: () {
                  onTap(2);
                },
                isClicked: isClicked[2],
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
