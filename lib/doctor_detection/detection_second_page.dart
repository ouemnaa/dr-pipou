import 'package:drpipou/Data/doctor_data.dart';
import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/my_text_button.dart';
import 'package:drpipou/components/symptoms_text_field.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/doctor_detection/detection_first_page.dart';
import 'package:drpipou/doctor_detection/detection_third_page.dart';
import 'package:drpipou/doctor_interface/symptom_main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DetectionSecondPage extends StatefulWidget {
  DetectionSecondPage({super.key});

  @override
  State<DetectionSecondPage> createState() => _DetectionSecondPageState();
}

class _DetectionSecondPageState extends State<DetectionSecondPage> {
  //se symptoms//
  final List secondPageDetection = [
    [
      "Radius",
      "Radius",
      "What is the standard error for the mean of distances from the center to the perimeter?"
    ],
    [
      "Texture",
      "Texture",
      "What is the standard error for the variation in gray-scale values?"
    ],
    [
      "Perimeter",
      "Perimeter",
      "What is the standard error for the size of the perimeter?",
    ],
    [
      "Area",
      "Area",
      "What is the standard error for the area of the tumor?",
    ],
    [
      "Smoothness",
      "Smoothness",
      "What is the standard error for the local variation in the tumor's radius?",
    ],
    [
      "Compact.",
      "Compacteness",
      "What is the standard error for the compactness of the tumor?",
    ],
    [
      "Concavity",
      "Concavity",
      "What is the standard error for the severity of concave portions (indentations) on the tumor?",
    ],
    [
      "Conc. Pnts",
      "Concave Points",
      "What is the standard error for the number of concave points (inward points) on the tumor’s contour?",
    ],
    [
      "Symmetry",
      "Symmetry",
      "What is the standard error for the symmetry of the tumor?",
    ],
    [
      "Fract. Dim.",
      "Fractal Dimension",
      "What is the standard error for the complexity of the tumor's boundary (approximated by 'coastline' measures)?",
    ],
    ["", "", ""],
    ["", "", ""],
  ];

  List<TextEditingController> _controllers = [];
  int _numberOfFields = 12;
  final _seBox = Hive.box('sesymptoms');
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
      db.seSymptoms = symptomValues;
      db.updateSE();
      debugPrint(
          "///////////////////////////////////////////////////////////////////////");
      print(db.seSymptoms);

      ///debugging
      db.loadAverage();
      print(db.averageSymptoms);
      ///////////////////////////////////////////
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SymptomMain(
                valuesToFill: 'Worst Values',
                page: 'page 3',
                child: DetectionThirdPage())),
      );
      //////////////////////////////////////////////////////
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
                    abrev: secondPageDetection[index][0],
                    symtomName: secondPageDetection[index][1],
                    description: secondPageDetection[index][2],
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
                  textAction: "next page",
                  onTap: nextPage,
                ),
                MyTextButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SymptomMain(
                              valuesToFill: 'Average Values',
                              page: 'page 2',
                              child: DetectionFirstPage())),
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
