import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDropDown extends StatefulWidget {
  final Function(String)? onChanged;
  String defaultValue;
  List<String> particularList;
  CustomDropDown({super.key, required this.defaultValue, required this.onChanged,required this.particularList});
  @override
  State<CustomDropDown> createState() => CustomDropDownState();
}

class CustomDropDownState extends State<CustomDropDown> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: DropdownButton<String>(
          value: widget.defaultValue,
          icon: Icon(
            Icons.arrow_downward,
            color: Colors.red.shade600,
          ),
          elevation: 16,
          style: TextStyle(color: Colors.red.shade600),
          underline: Container(height: 2, color: Colors.red.shade600),
          onChanged: (String? newValue) {
            setState(() {
              widget.defaultValue = newValue!;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(newValue!);
            }
          },
          items: widget.particularList
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
