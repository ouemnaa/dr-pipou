import 'package:drpipou/Data/user_data.dart';
import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/circular_choice.dart';
import 'package:drpipou/components/my_text_button.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/constants/symptom_lists.dart';
import 'package:drpipou/pages/symptom_detection.dart';
import 'package:drpipou/patient_interface/patient_home.dart';
import 'package:drpipou/patient_interface/safe.dart';
import 'package:drpipou/reccurence_detection/symptom2.dart';
import 'package:drpipou/reccurence_detection/symptom6.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Symptom3 extends StatefulWidget {
  const Symptom3({super.key});

  @override
  State<Symptom3> createState() => _Symptom3State();
}

class _Symptom3State extends State<Symptom3> {
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
  List<bool> isClicked = List<bool>.filled(13, false);
  List values = [
    "0-2",
    "3-5",
    "6-8",
    "18-20",
    "21-23",
    "24-26",
    "27-29",
    "30-32",
    "33-35",
    "36-39",
    "",
    "",
    "",
  ];
  void onTap(int index) {
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
                totalSymptoms: 8,
                symptomName: "Tumor Size",
                symptomDescription: "Please choose the size of the tumor.",
                progress: num - 2,
                child: Symptom2(),
              )),
    );
  }

  // void nextQuestion() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) => SymptomDetection(
  //               color: lightPink,
  //               symptomNum: num + 1,
  //               totalSymptoms: 8,
  //               symptomName: "Affected Breast",
  //               symptomDescription: "Which breast is affected ?",
  //               progress: 3,
  //               child: Symptom6(),
  //             )),
  //   );
  // }
  List<int> getResult() {
    String char = "", c1 = "", c2 = "";
    for (int i = 0; i < isClicked.length; i++) {
      if (isClicked[i] == true) {
        char = values[i];
        break;
      }
    }
    int p = char.indexOf("-");
    for (int i = 0; i < p; i++) {
      c1 += char[i];
    }
    for (int i = p + 1; i < char.length; i++) {
      c2 += char[i];
    }
    return [int.parse(c1), int.parse(c2)];
  }

  void endDiagnosis() {
    db.loadAll();
    List res = getResult();
    db.userSymptoms += res;
    db.updateAll();
    print(db.userSymptoms);
    print(db.userSymptoms);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Safe(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Stack(
        children: [
          GridView.count(
            padding: EdgeInsets.all(5),
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 25.0, // Spacing between columns
            mainAxisSpacing: 25.0, // Spacing between rows
            children: List.generate(13, (index) {
              return CircularChoice(
                h: 55,
                w: 55,
                value: values[index],
                onTap: () {
                  onTap(index);
                },
                isClicked: isClicked[index],
                visible: index < 10 ? true : false,
              );
            }),
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
                            textAction: "end diagnosis",
                            onTap: endDiagnosis,
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
    ;
  }
}
