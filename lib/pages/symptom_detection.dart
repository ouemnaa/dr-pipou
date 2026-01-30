import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/progress_bar.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/patient_interface/patient_home.dart';
import 'package:flutter/material.dart';

class SymptomDetection extends StatelessWidget {
  final Widget? child;
  final Color color;
  final int symptomNum;
  final int totalSymptoms;
  final String symptomName;
  final String symptomDescription;
  final double progress;
  SymptomDetection(
      {super.key,
      required this.child,
      required this.color,
      required this.symptomNum,
      required this.totalSymptoms,
      required this.symptomName,
      required this.symptomDescription,
      required this.progress});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: color,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(""),
                        Row(
                          children: [
                            Text(
                              symptomNum.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              " of ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: gray),
                            ),
                            Text(
                              totalSymptoms.toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: gray),
                            ),
                          ],
                        ),
                        GestureDetector(
                          child: Icon(Icons.cancel_outlined),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PatientHome(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ProgressBar(
                        progress: progress,
                        color: totalSymptoms == 9 ? darkPink : darkBlue),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      //color: darkBlue,
                      child: Text(
                        symptomName,
                        //"Symptom Name Worst Case is this",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //color: lightPink,
                        child: Text(
                          symptomDescription,
                          //"How compact is the tumor based on its perimeter and area?(Higher compactness indicates the tumor is more circular and less irregular.)",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: Center(child: child),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
