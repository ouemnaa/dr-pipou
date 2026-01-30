import 'package:drpipou/chatbot/chat_page.dart';
import 'package:drpipou/components/action_button.dart';
import 'package:drpipou/components/my_text_button.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/patient_interface/patient_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatbotHome extends StatelessWidget {
  const ChatbotHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: SvgPicture.asset("assets/images/others/chatbot.svg"),
                ),
              ),
              color: lightPink,
            ),
            Expanded(
              child: Container(
                color: backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    left: 21,
                    right: 21,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Start a chat with Poupi     ",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "get to learn more about Breast Cancer and ways to prevent it"),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          ActionButton(
                            color: darkPink,
                            textAction: 'start chatting',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatPage()));
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          MyTextButton(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PatientHome()),
                                );
                              },
                              writingColor: darkPink,
                              text: "go back"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
