import 'package:drpipou/Data/user_data.dart';
import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/my_text_button.dart';
import 'package:drpipou/components/quads.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/constants/symptom_lists.dart';
import 'package:drpipou/pages/symptom_detection.dart';
import 'package:drpipou/reccurence_detection/symptom2.dart';
import 'package:drpipou/reccurence_detection/symptom6.dart';
import 'package:drpipou/reccurence_detection/symptom8.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

class Symptom7 extends StatefulWidget {
  const Symptom7({super.key});

  @override
  State<Symptom7> createState() => _Symptom7State();
}

class _Symptom7State extends State<Symptom7> {
  @override
  void initState() {
    super.initState();
    if (_userSymptomsBox.get("usersSymptoms") != null) {
      db.loadAll();
    }
  }

  final _userSymptomsBox = Hive.box('usersymptoms');
  UserData db = UserData();
  final index = 6;
  final num = 5;
  bool answered = false;

  List<bool> isClicked = List<bool>.filled(5, false);
  void onTap(int index) {
    setState(() {
      if (isClicked[index] == false) {
        isClicked.fillRange(0, isClicked.length, false);
        isClicked[index] = true;
        answered = true;
      }
    });
  }

  void previousQuestion() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SymptomDetection(
                color: lightPink,
                symptomNum: num - 1,
                totalSymptoms: 8,
                symptomName: "Affected Breast",
                symptomDescription: "Which breast is affected ?",
                progress: num - 2,
                child: Symptom6(),
              )),
    );
  }

  int getResult() {
    int index = -1;
    for (int i = 0; i < isClicked.length; i++) {
      if (isClicked[i] == true) ;
      index = i;
      break;
    }
    if (index == 0) {
      return 4;
    } else if (index == 1) {
      return 1;
    } else if (index == 2) {
      return 3;
    } else if (index == 3) {
      return 0;
    } else {
      return 0;
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
                symptomName: "Irradiate",
                symptomDescription:
                    "Have you recieved any radiation treatments ?",
                progress: 5,
                child: Symptom8(),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    List homeMadeWidgets = [
      SizedBox(
        height: 20,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Quads(
                quadNum: 1,
                text1: "left",
                text2: " up",
                onTap: () {
                  onTap(1);
                },
                isClicked: isClicked[1],
              ),
              Quads(
                quadNum: 2,
                text1: "right ",
                text2: "up",
                onTap: () {
                  onTap(2);
                },
                isClicked: isClicked[2],
              ),
            ],
          ),
          Quads(
            quadNum: 0,
            text1: "center",
            text2: "",
            onTap: () {
              onTap(0);
            },
            isClicked: isClicked[0],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Quads(
                quadNum: 3,
                text1: "left ",
                text2: "low",
                onTap: () {
                  onTap(3);
                },
                isClicked: isClicked[3],
              ),
              Quads(
                quadNum: 4,
                text1: 'right',
                text2: 'low',
                onTap: () {
                  onTap(4);
                },
                isClicked: isClicked[4],
              )
            ],
          ),
        ],
      ),
      SizedBox(
        height: 20,
      )
    ];
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Quads(
                        quadNum: 1,
                        text1: "left",
                        text2: " up",
                        onTap: () {
                          onTap(1);
                        },
                        isClicked: isClicked[1],
                      ),
                      Quads(
                        quadNum: 2,
                        text1: "right ",
                        text2: "up",
                        onTap: () {
                          onTap(2);
                        },
                        isClicked: isClicked[2],
                      ),
                    ],
                  ),
                  Quads(
                    quadNum: 0,
                    text1: "center",
                    text2: "",
                    onTap: () {
                      onTap(0);
                    },
                    isClicked: isClicked[0],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Quads(
                        quadNum: 3,
                        text1: "left ",
                        text2: "low",
                        onTap: () {
                          onTap(3);
                        },
                        isClicked: isClicked[3],
                      ),
                      Quads(
                        quadNum: 4,
                        text1: 'right',
                        text2: 'low',
                        onTap: () {
                          onTap(4);
                        },
                        isClicked: isClicked[4],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 150,
              )
            ],
            //   itemCount:3
            //  itemBuilder: (BuildContext context, int index) {  return ListTile(homeMadeWidgets[index]);},
          ),
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
    );
  }
}
