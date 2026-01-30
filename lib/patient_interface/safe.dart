import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/patient_interface/patient_home.dart';
import 'package:flutter/material.dart';

class Safe extends StatelessWidget {
  const Safe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You",
                    style: TextStyle(
                      color: darkPink,
                      fontSize: 64,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "are",
                    style: TextStyle(
                      color: lightPink,
                      fontSize: 64,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "safe",
                    style: TextStyle(
                      fontSize: 64,
                      color: lightBlue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.favorite,
                size: 200,
                color: lightPink,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Text(
              "However, consulting a doctor is always advised. There is no harm in checking in with a doctor.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          ActionButton(
            color: darkPink,
            textAction: "save results",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientHome(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
