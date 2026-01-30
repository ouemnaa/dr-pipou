import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/doctor_interface/doc_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class RiskDoc extends StatelessWidget {
  const RiskDoc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Your patient has risk of breast cancer,",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 20,
            ),
            child: Text(
                "Your final diagnosis is what matters but we ty our best to provide the help necessary"),
          ),
          SizedBox(
            height: 30,
          ),
          ActionButton(
            color: darkBlue,
            textAction: 'return home',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DocHome()),
              );
            },
          )
        ],
      ),
    );
  }
}
