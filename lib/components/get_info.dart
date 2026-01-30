import 'package:drpipou/constants/colors.dart';
import 'package:flutter/material.dart';

class GetInfo extends StatelessWidget {
  final String symptomName;
  final String description;
  GetInfo({
    super.key,
    required this.symptomName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Customize shape
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                height: 250, // Set a custom height
                child: Column(
                  children: [
                    Text(
                      symptomName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      description,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          color: lightBlue,
          border: Border.all(color: lightBlue),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          Icons.question_mark,
          size: 10,
          color: backgroundColor,
        ),
      ),
    );
  }
}
