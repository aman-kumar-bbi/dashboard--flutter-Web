import 'package:flutter/material.dart';

class CheckBoxes extends StatefulWidget {
  const CheckBoxes({super.key});

  @override
  State<CheckBoxes> createState() => _CheckBoxesState();
}

bool isAndroid = false;
bool isiOS = false;
bool isWebApp = false;

class _CheckBoxesState extends State<CheckBoxes> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        CheckboxListTile(
            title: Text("Android"),
            value: isAndroid,
            onChanged: (val) {
              setState(() {
                isAndroid = val!;
              });
            }),
        CheckboxListTile(
            title: Text("iOS"),
            value: isiOS,
            onChanged: (val) {
              setState(() {
                isiOS = val!;
              });
            }),
        CheckboxListTile(
            title: Text("WebApp"),
            value: isWebApp,
            onChanged: (val) {
              setState(() {
                isWebApp = val!;
              });
            }),
        
      ],
    ));
  }
}
