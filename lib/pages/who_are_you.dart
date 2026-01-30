import 'package:drpipou/components/yes_no_button.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/doctor_interface/doc_home.dart';
import 'package:drpipou/patient_interface/patient_home.dart';
import 'package:flutter/material.dart';

class WhoAreYou extends StatelessWidget {
  const WhoAreYou({super.key});

  @override
  Widget build(BuildContext context) {
    void _gotoDr() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DocHome(),
        ),
      );
    }

    void _goToUser() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PatientHome(),
        ),
      );
    }

    return Center(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 450,
                child: Center(
                  child: Text(
                    "Are you a doctor ?",
                    style: TextStyle(
                      color: darkPink,
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  YesNoButton(text: "Yes", onTap: _gotoDr),
                  SizedBox(
                    width: 25,
                  ),
                  YesNoButton(
                    text: "No",
                    onTap: _goToUser,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
