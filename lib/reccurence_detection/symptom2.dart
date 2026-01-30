import 'package:drpipou/Data/user_data.dart';
import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/circular_choice.dart';
import 'package:drpipou/components/my_text_button.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/constants/symptom_lists.dart';
import 'package:drpipou/pages/symptom_detection.dart';
import 'package:drpipou/reccurence_detection/symptom3.dart';
import 'package:drpipou/reccurence_detection/symptom5.dart';
import 'package:drpipou/reccurence_detection/symptom9.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Symptom2 extends StatefulWidget {
  const Symptom2({super.key});

  @override
  State<Symptom2> createState() => _Symptom2State();
}

class _Symptom2State extends State<Symptom2> {
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
  List<bool> isClicked = List<bool>.filled(15, false);
  List values = [
    "0-4",
    "5-9",
    "10-14",
    "15-19",
    "20-24",
    "25-26",
    "30-34",
    "35-39",
    "40-44",
    "45-49",
    "50-54",
    "55-59",
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

  final index = 1;
  final num = 8;
  void previousQuestion() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SymptomDetection(
                color: lightPink,
                symptomNum: num - 1,
                totalSymptoms: 8,
                symptomName: "Age",
                symptomDescription: "Please state your age range",
                progress: num - 2,
                child: Symptom9(),
              )),
    );
  }

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

  void nextQuestion() {
    db.loadAll();
    List res = getResult();
    db.userSymptoms += res;
    db.updateAll();
    print(db.userSymptoms);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SymptomDetection(
                color: lightPink,
                symptomNum: num + 1,
                totalSymptoms: 9,
                symptomName: "Involved Nodes",
                symptomDescription:
                    "Please choose the number of involved nodes detected.",
                progress: 8,
                child: Symptom3(),
              )),
    );
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
            children: List.generate(15, (index) {
              return CircularChoice(
                h: 55,
                w: 55,
                value: values[index],
                onTap: () {
                  onTap(index);
                },
                isClicked: isClicked[index],
                visible: index < 12 ? true : false,
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
    ;
  }
}
