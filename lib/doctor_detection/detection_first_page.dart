import 'package:drpipou/Data/doctor_data.dart';
import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/symptoms_text_field.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/doctor_detection/detection_second_page.dart';
import 'package:drpipou/doctor_interface/symptom_main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DetectionFirstPage extends StatefulWidget {
  DetectionFirstPage({super.key});

  @override
  State<DetectionFirstPage> createState() => _DetectionFirstPageState();
}

class _DetectionFirstPageState extends State<DetectionFirstPage> {
  //average symptoms//
  final List firstPageDetection = [
    [
      "Radius",
      "Radius",
      "What is the average distance from the center of the tumor to its perimeter (in mm)?"
    ],
    [
      "Texture",
      "Texture",
      "What is the average variation in the brightness (gray-scale values) of the tissue images?"
    ],
    [
      "Perimeter",
      "Perimeter",
      "What is the average size of the perimeter around the tumor?",
    ],
    [
      "Area",
      "Area",
      "What is the average area of the tumor (in mm²)?",
    ],
    [
      "Smoothness",
      "Smoothness",
      "On average, how much variation in the tumor's radius is there, indicating smooth or irregular edges?",
    ],
    [
      "Compact.",
      "Compacteness",
      "How compact is the tumor based on its perimeter and area?(Higher compactness indicates the tumor is more circular and less irregular.)",
    ],
    [
      "Concavity",
      "Concavity",
      "How severe are the concave portions (indentations) of the tumor’s contour?",
    ],
    [
      "Conc. Pnts",
      "Concave Points",
      "How many concave (inward) points are there on the tumor's surface?",
    ],
    [
      "Symmetry",
      "Symmetry",
      "How symmetrical is the tumor",
    ],
    [
      "Fract. Dim.",
      "Fractal Dimension",
      "How complex is the boundary of the tumor? This measures how detailed the edge is.",
    ],
    ["", "", ""],
    ["", "", ""],
  ];

  List<TextEditingController> _controllers = [];

  int _numberOfFields = 12;
  final _averageBox = Hive.box('averagesymptoms');
  DoctorData db = DoctorData();
  @override
  void initState() {
    super.initState();

    _controllers =
        List.generate(_numberOfFields, (index) => TextEditingController());
    if (_averageBox.get("averageSymptoms") != null) {
      db.loadAverage();
    }
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
      print(l);
      List<double> symptomValues = [];
      symptomValues = getValues();
      db.averageSymptoms = symptomValues;
      db.updateAverage();
      debugPrint("THESE ARE THE AVERAGE SYMTOMS");
      print(
          "/////////////////////////////////////////////////////////////////");
      print(db.averageSymptoms);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SymptomMain(
                valuesToFill: 'SE Values',
                page: 'page 2',
                child: DetectionSecondPage())),
      );
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
            padding: const EdgeInsets.only(
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
                  bool visible = index < 10;
                  return SymptomsTextField(
                    abrev: firstPageDetection[index][0],
                    symtomName: firstPageDetection[index][1],
                    description: firstPageDetection[index][2],
                    controller: _controllers[index],
                    visible: visible,
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
              child: ActionButton(
                color: darkBlue,
                textAction: "next page",
                onTap: nextPage,
              )),
        )
      ],
    );
  }
}
