import 'dart:ui';

import 'package:drpipou/reccurence_detection/symptom1.dart';
import 'package:drpipou/reccurence_detection/symptom2.dart';
import 'package:drpipou/reccurence_detection/symptom3.dart';
import 'package:drpipou/reccurence_detection/symptom4.dart';
import 'package:drpipou/reccurence_detection/symptom5.dart';
import 'package:drpipou/reccurence_detection/symptom6.dart';
import 'package:drpipou/reccurence_detection/symptom7.dart';
import 'package:drpipou/reccurence_detection/symptom8.dart';
import 'package:flutter/material.dart';

Color darkPink = const Color(0xFFE481A0);
Color lightPink = const Color(0xFFF7BACE);
Color darkBlue = const Color(0xFF5399DE);
Color lightBlue = const Color(0xFF9AC2E6);
Color gray = const Color(0xFF9C9797);
Color backgroundColor = const Color(0xFFFFFDF1);

/////////////////RECURRENCE SYMPTOMS/////////////////
List recSymptoms = [
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
    "Affected quadrant"
        "Please select the affected quadrant of the breast.",
    Symptom7(),
  ],
  [
    "Irradiate",
    "Have you recieved any radiation treatments ?",
    Symptom8(),
  ]
];
