import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDropDown extends StatefulWidget {
  // final String  dropdownValue;
  // List dropDownListValue;
  // CustomDropDown({t});
  // final bool isregion;
  // CustomDropDown({required this.isregion});
  @override
  State<CustomDropDown> createState() => CustomDropDownState();
}

class CustomDropDownState extends State<CustomDropDown> {
  String dropdownValue="Europe";
  // late List<String> listOfValue;
  @override
  Widget build(BuildContext context) {
    // if (widget.isregion == true) {
    //   setState(() {
    //     dropdownValue = 'Europe';
    //     listOfValue=["Europe","USA"];
    //   });
    // } else {
    //   setState(() {
    //     dropdownValue = 'Europe';
    //     listOfValue=["Germanm,English"];
    //   });
    // }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(
            Icons.arrow_downward,
            color: Colors.red.shade600,
          ),
          elevation: 16,
          style: TextStyle(color: Colors.red.shade600),
          underline: Container(height: 2, color: Colors.red.shade600),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>["Europe","USA"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
