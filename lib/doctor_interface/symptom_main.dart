import 'package:drpipou/components/symptoms_text_field.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/doctor_interface/doc_home.dart';
import 'package:flutter/material.dart';

class SymptomMain extends StatelessWidget {
  final Widget child;
  final String valuesToFill;
  final String page;
  SymptomMain({
    super.key,
    required this.child,
    required this.valuesToFill,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: lightBlue,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 35,
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
                              page,
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
                              "3",
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
                                builder: (context) => DocHome(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      //color: darkBlue,
                      child: Text(
                        valuesToFill,
                        //"Symptom Name Worst Case is this",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
