import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/patient_interface/patient_home.dart';
import 'package:flutter/material.dart';

class Risk extends StatelessWidget {
  const Risk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Text(
              "It might be worthwhile to talk to a medical professional for further insight.",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            child: Text(
              "this is only a preliminary assessment and not a diagnosis. Consulting with a doctor can provide a clearer understanding and help you decide on any next steps. Your health and peace of mind are important to            us.",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Icon(Icons.favorite),
          const SizedBox(
            height: 50,
          ),
          ActionButton(
            color: darkPink,
            textAction: "save results",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PatientHome()),
              );
            },
          )
        ],
      ),
    );
  }
}
