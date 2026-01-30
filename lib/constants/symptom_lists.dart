import 'package:drpipou/reccurence_detection/symptom1.dart';
import 'package:drpipou/reccurence_detection/symptom2.dart';
import 'package:drpipou/reccurence_detection/symptom3.dart';
import 'package:drpipou/reccurence_detection/symptom4.dart';
import 'package:drpipou/reccurence_detection/symptom5.dart';
import 'package:drpipou/reccurence_detection/symptom6.dart';
import 'package:drpipou/reccurence_detection/symptom7.dart';
import 'package:drpipou/reccurence_detection/symptom8.dart';
/////////////////RECURRENCE SYMPTOMS/////////////////

List reccSymptoms = [
  [
    "Are you in Menopause?",
    "",
    Symptom1(),
  ],
  [
    "Tumor Size",
    "Please choose the size of the tumor.",
    Symptom2(),
  ],
  [
    "Involved Nodes",
    "Please choose the number of involved nodes detected.",
    Symptom3(),
  ],
  [
    "Node Caps",
    "Have any  of the nodes shown capsular invasion ?",
    Symptom4(),
  ],
  [
    "Degree of Maligancy",
    "Please state the degree of maligancy (severety of the tumor)",
    Symptom5(),
  ],
  [
    "Affected Breast",
    "Which breast is affected ?",
    Symptom6(),
  ],
  [
    "Affected quadrant",
    "Please select the affected quadrant of the breast.",
    Symptom7(),
  ],
  [
    "Irradiate",
    "Have you recieved any radiation treatments ?",
    Symptom8(),
  ]
];

//////////////////////FIRST DETECTION SYMPTOMS//////////////////////////////////