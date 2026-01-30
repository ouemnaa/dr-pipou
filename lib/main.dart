import 'package:drpipou/chatbot/chat_page.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/doctor_interface/risk.dart';
import 'package:drpipou/doctor_interface/symptoms_home.dart';
import 'package:drpipou/pages/symptom_detection.dart';
import 'package:drpipou/pages/who_are_you.dart';
import 'package:drpipou/patient_interface/chatbot_home.dart';
import 'package:drpipou/patient_interface/patient_home.dart';
import 'package:drpipou/patient_interface/recurrence_symptoms_home.dart';
import 'package:drpipou/patient_interface/risk.dart';
import 'package:drpipou/patient_interface/safe.dart';
import 'package:drpipou/reccurence_detection/symptom2.dart';
import 'package:drpipou/reccurence_detection/symptom3.dart';
import 'package:drpipou/reccurence_detection/symptom4.dart';
import 'package:drpipou/reccurence_detection/symptom5.dart';
import 'package:drpipou/reccurence_detection/symptom6.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'reccurence_detection/symptom1.dart';
import 'package:flutter/material.dart';

void main() async {
  //initialize hive
  await Hive.initFlutter();

  //open the box
  var averagebox = await Hive.openBox('averagesymptoms');
  var sebox = await Hive.openBox('sesymptoms');
  var worstbox = await Hive.openBox('worstsymptoms');
  var userbox = await Hive.openBox('usersymptoms');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Sen',
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: WhoAreYou());
  }
}
