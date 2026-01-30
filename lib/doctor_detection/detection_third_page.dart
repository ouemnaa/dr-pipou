import 'package:drpipou/Data/doctor_data.dart';
import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/my_text_button.dart';
import 'package:drpipou/components/symptoms_text_field.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/doctor_detection/detection_second_page.dart';
import 'package:drpipou/doctor_detection/symptom_results.dart';
import 'package:drpipou/doctor_interface/doc_home.dart';
import 'package:drpipou/doctor_interface/risk.dart';
import 'package:drpipou/doctor_interface/symptom_main.dart';
import 'package:drpipou/patient_interface/safe.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DetectionThirdPage extends StatefulWidget {
  DetectionThirdPage({super.key});

  @override
  State<DetectionThirdPage> createState() => _DetectionThirdPageState();
}

class _DetectionThirdPageState extends State<DetectionThirdPage> {
  ////////worst symptoms////////
  final List thirdPageDetection = [
    [
      "Radius",
      "Radius",
      "What is the largest (worst) mean value for the distances from the center of the tumor to the points on its perimeter?"
    ],
    [
      "Texture",
      "Texture",
      "What is the largest (worst) mean value for the variation in gray-scale values (brightness) of the tissue?"
    ],
    [
      "Perimeter",
      "Perimeter",
      "What is the largest (worst) mean value for the size of the tumor’s perimeter?",
    ],
    [
      "Area",
      "Area",
      "What is the largest (worst) mean value for the area of the tumor (in mm²)?",
    ],
    [
      "Smoothness",
      "Smoothness",
      "What is the largest (worst) mean value for the variation in the tumor's radius?",
    ],
    [
      "Compact.",
      "Compacteness",
      "What is the largest (worst) mean value for the compactness of the tumor (perimeter² / area - 1.0)?",
    ],
    [
      "Concavity",
      "Concavity",
      "What is the largest (worst) mean value for the severity of concave portions of the tumor?",
    ],
    [
      "Conc. Pnts",
      "Concave Points",
      "What is the largest (worst) mean value for the number of concave points on the tumor?",
    ],
    [
      "Symmetry",
      "Symmetry",
      "...",
    ],
    [
      "Fract. Dim.",
      "Fractal Dimension",
      "What is the largest (worst) mean value for the complexity of the tumor's boundary, using the 'coastline approximation'?",
    ],
    ["", "", ""],
    ["", "", ""],
  ];

  List<TextEditingController> _controllers = [];
  int _numberOfFields = 12;
  DoctorData db = DoctorData();
  @override
  void initState() {
    super.initState();
    _controllers =
        List.generate(_numberOfFields, (index) => TextEditingController());
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  List isEmpty(List<TextEditingController> cont) {
    List unwritten = [];
    for (int i = 0; i < 10; i++) {
      if (cont[i].text.isEmpty) {
        unwritten += [i];
      }
    }
    if (unwritten.length == 0) {
      return [-1];
    } else {
      return unwritten;
    }
  }

  List<double> getValues() {
    List<double> l = [];
    for (int i = 0; i < 10; i++) {
      String value = _controllers[i].text;
      l += [double.parse(value)];
    }
    return l;
  }

  void nextPage() {
    List l = isEmpty(_controllers);
    if (l.length == 1 && l[0] == -1) {
      List<double> symptomValues = [];
      symptomValues = getValues();
      db.worstSymptoms = symptomValues;
      db.updateWorst();
      db.loadAverage();
      db.loadSE();
      print(db.averageSymptoms);
      print(db.seSymptoms);
      debugPrint(
          "///////////////////////////////////////////////////////////////////////");
      debugPrint("NOTHING HAPPENING JUST DEBUGGING");
      print(db.worstSymptoms);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RiskDoc(),
        ),
      );
      ////////////////B E S T      C A S E/////////////////////
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => SymptomResults(),
      //   ),
      // );
      ///////////////////////////////////////
    } else {
      setState(() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: const Color.fromARGB(119, 255, 51, 36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Customize shape
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                height: 200, // Set a custom height
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    " Please provide all necessary infomation ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ),
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(
              left: 40,
              right: 40,
              top: 25,
              bottom: 0,
            ),
            child: GridView.count(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 40, // Spacing between columns
              mainAxisSpacing: 0, // Spacing between rows
              children: List.generate(
                12,
                (index) {
                  return SymptomsTextField(
                    abrev: thirdPageDetection[index][0],
                    symtomName: thirdPageDetection[index][1],
                    description: thirdPageDetection[index][2],
                    controller: _controllers[index],
                    visible: index < 10 ? true : false,
                  );
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ActionButton(
                  color: darkBlue,
                  textAction: "end diagnosis",
                  onTap: nextPage,
                ),
                MyTextButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SymptomMain(
                              valuesToFill: 'SE Values',
                              page: 'page 2',
                              child: DetectionSecondPage())),
                    );
                  },
                  writingColor: darkBlue,
                  text: "previous page",
                ),
              ],
            ),
          ),
        )
      ],
    );
    ;
  }
}
