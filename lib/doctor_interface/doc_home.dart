import 'package:drpipou/components/bottom_message.dart';
import 'package:drpipou/components/detection_tile.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:drpipou/doctor_interface/symptoms_home.dart';
import 'package:drpipou/pages/pic_detection.dart';
import 'package:drpipou/pages/who_are_you.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DocHome extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List detect = [
    [
      "assets/images/icons/pic_detection.svg",
      "Detect with image      ",
      "provide a mammography",
    ],
    [
      "assets/images/icons/symptom_detection.svg",
      "Detect with symptoms",
      "1st accurance detection"
    ]
  ];
  DocHome({super.key});

  @override
  Widget build(BuildContext context) {
    void detect0() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PicDetection(
                  writingColor: darkBlue,
                  feelColor: lightBlue,
                  onTap: () {
                    Navigator.pop(context);
                  },
                )),
      );
    }

    void detect1() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SymptomsHome()),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: backgroundColor,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.only(
              top: 60,
            ),
            children: <Widget>[
              SvgPicture.asset("assets/images/others/other_doc_acc.svg"),
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
                    MaterialPageRoute(builder: (context) => WhoAreYou()),
                  );
                },
                child: ListTile(
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
        padding: const EdgeInsets.only(top: 25.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "Hello Dr. Nour",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "We will help you check your patient's",
                    style: TextStyle(
                      fontSize: 16,
                      color: gray,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "health with our ",
                        style: TextStyle(
                          fontSize: 16,
                          color: gray,
                        ),
                      ),
                      Text(
                        "early diagnoisis",
                        style: TextStyle(
                          fontSize: 16,
                          color: darkBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  DetectionTile(
                    icon_path: detect[0][0],
                    detection_type: detect[0][1],
                    sub_text: detect[0][2],
                    color: Color.fromARGB(81, 83, 153, 222),
                    onTap: detect0,
                  ),
                  SizedBox(
                    height: 44,
                  ),
                  DetectionTile(
                    icon_path: detect[1][0],
                    detection_type: detect[1][1],
                    sub_text: detect[1][2],
                    color: Color.fromARGB(81, 83, 153, 222),
                    onTap: detect1,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomMessage(color: lightBlue),
    );
  }
}
