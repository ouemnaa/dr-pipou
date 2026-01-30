import 'package:drpipou/components/get_info.dart';
import 'package:drpipou/constants/colors.dart';
import 'package:flutter/material.dart';

class SymptomsTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String symtomName;
  final String description;
  final String abrev;
  final bool visible;
  SymptomsTextField({
    super.key,
    required this.symtomName,
    required this.description,
    required this.abrev,
    this.controller,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return visible
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    abrev,
                    style: TextStyle(
                      color: visible ? lightBlue : backgroundColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GetInfo(
                    symptomName: symtomName,
                    description: description,
                  ),
                ],
              ),
              Flexible(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.numberWithOptions(),
                  cursorColor: darkBlue,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: lightBlue),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: darkBlue,
                        ), // Focused border color
                      ),
                      hintText: "enter value...",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(123, 129, 127, 127),
                        fontSize: 11,
                      )),
                ),
              ),
            ],
          )
        : Text("");
  }
}
