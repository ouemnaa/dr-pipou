import 'package:drpipou/Data/user_data.dart';
import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/rectangular_choice.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/constants/symptom_lists.dart';
import 'package:drpipou/pages/symptom_detection.dart';
import 'package:drpipou/reccurence_detection/symptom4.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Symptom1 extends StatefulWidget {
  final void Function()? onTap;
  const Symptom1({
    super.key,
    this.onTap,
  });

  @override
  State<Symptom1> createState() => _Symptom1State();
}

class _Symptom1State extends State<Symptom1> {
  final _userSymptomsBox = Hive.box('usersymptoms');
  UserData db = UserData();
  @override
  void initState() {
    super.initState();
    if (_userSymptomsBox.get("usersSymptoms") != null) {
      db.loadAll();
    } else {
      db.createInitialData();
    }
  }

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

  int getresult() {
    if (clickYes == true) {
      return 0;
    } else {
      return 1;
    }
  }

  final index = 0;
  final num = 1;
  final double progress = 0;
  void nextQuestion() {
    // db.loadAll();
    print(db.userSymptoms);
    int res = getresult();
    db.userSymptoms[0] = res;
    db.updateAll();
    print(db.userSymptoms);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SymptomDetection(
                color: lightPink,
                symptomNum: num + 1,
                totalSymptoms: 9,
                symptomName: "Node Caps",
                symptomDescription:
                    "Have any  of the nodes shown capsular invasion ?",
                progress: progress + 1,
                child: Symptom4(),
              )),
    );
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
                      alignment: AlignmentDirectional.bottomCenter,
                      child: ActionButton(
                        color: darkPink,
                        textAction: "next question",
                        onTap: nextQuestion,
                      )),
                )
              : Text(""),
        ],
      ),
    );
  }
}
