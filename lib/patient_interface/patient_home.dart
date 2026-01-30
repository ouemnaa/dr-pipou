import 'package:drpipou/components/bottom_message.dart';
import 'package:drpipou/components/detection_tile.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/pages/pic_detection.dart';
import 'package:drpipou/pages/who_are_you.dart';
import 'package:drpipou/patient_interface/chatbot_home.dart';
import 'package:drpipou/patient_interface/recurrence_symptoms_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class PatientHome extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List detect = [
    [
      "assets/images/icons/pic_detection.svg",
      "Detect with image      ",
      "provide a mammography",
    ],
    [
      "assets/images/icons/symptom_detection.svg",
      "Detect with symptoms  ",
      "recurrence detection  "
    ]
  ];
  PatientHome({super.key});

  @override
  Widget build(BuildContext context) {
    void detect0() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PicDetection(
            feelColor: lightPink,
            writingColor: darkPink,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    }

    void detect1() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecurrenceSymptomsHome()),
      );
    }

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          // actions: [
          //   //chat with poupi
          //   IconButton(
          //     icon: const Icon(Icons.chat),
          //     onPressed: () {
          //       // Navigator.push(
          //       //   context,
          //       //   MaterialPageRoute(builder: (context) => ChatPage()),
          //       // );
          //     },
          //   ),
          // ],
        ),
        drawer: Drawer(
          backgroundColor: backgroundColor,
          child: Center(
            child: ListView(
              padding: const EdgeInsets.only(
                top: 60,
              ),
              children: <Widget>[
                SvgPicture.asset("assets/images/others/poupi_patient_acc.svg"),
                const ListTile(
                  leading: Icon(Icons.account_circle_outlined),
                  title: Text('Profile'),
                  iconColor: Colors.black,
                  textColor: Colors.black,
                ),
                const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  iconColor: Colors.black,
                  textColor: Colors.black,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WhoAreYou()),
                    );
                  },
                  child: const ListTile(
                    leading: Icon(Icons.logout_rounded),
                    title: Text('Log out'),
                    iconColor: Colors.black,
                    textColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    const Text(
                      "Hello Sindy,",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SvgPicture.asset('assets/images/others/bg_decoration.svg'),
                    Positioned(
                      top: 70,
                      left: 10,
                      child: Container(
                        width: 289,
                        height: 66,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Get ",
                                  style: TextStyle(
                                    color: gray,
                                  ),
                                ),
                                Text(
                                  "recurrence diagnoisis ",
                                  style: TextStyle(
                                    color: darkPink,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "or start",
                                  style: TextStyle(
                                    color: gray,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "a ",
                                  style: TextStyle(
                                    color: gray,
                                  ),
                                ),
                                Text(
                                  "chat with Poupi ",
                                  style: TextStyle(
                                    color: darkPink,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "and learn more ",
                                  style: TextStyle(
                                    color: gray,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "about Breast Cancer",
                              style: TextStyle(
                                color: gray,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                // DetectionTile(
                //   icon_path: detect[0][0],
                //   detection_type: detect[0][1],
                //   sub_text: detect[0][2],
                //   color: Color.fromARGB(75, 228, 129, 160),
                //   onTap: detect0,
                // ),
                const SizedBox(
                  height: 44,
                ),
                DetectionTile(
                  icon_path: detect[1][0],
                  detection_type: detect[1][1],
                  sub_text: detect[1][2],
                  color: Color.fromARGB(75, 228, 129, 160),
                  onTap: detect1,
                ),
                const SizedBox(
                  height: 44,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final url =
                            'https://webchat.botframework.com/embed/drchatbot-bot?s=bKdzk3ucyag.Lxbf3aD0ANYwpKfpL2a6MhqaNP9Tt_V9N6jxdvZtTLA';
                        await launch(url);
                      },
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ChatbotHome(),
                      //     ),
                      //   );
                      // },
                      child: Icon(
                        shadows: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.5), // Shadow color with opacity
                            spreadRadius: -1, // Spread of the shadow
                            blurRadius: 7.8, // How blurry the shadow is
                            offset: Offset(0, 4), // Shadow position (x, y)
                          ),
                        ],
                        Icons.chat_sharp,
                        size: 100,
                        color: darkPink,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chat ",
                          style: TextStyle(
                            letterSpacing: 4,
                            fontSize: 10,
                          ),
                        ),
                        Text("with ",
                            style: TextStyle(
                              letterSpacing: 5,
                              fontSize: 10,
                            )),
                        Text("Poupi"),
                        Text(""),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomMessage(color: lightPink));
  }
}
