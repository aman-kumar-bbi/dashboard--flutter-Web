import 'package:dashboard/dashboard/domain/useCases/ButtonFunction.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/check_boxes.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/constant_text.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/custom_textfeild.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/drop_downs.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/logo_and_name.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/title_text_on_add_app_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/materialUi.dart';

class AddAppScreen extends StatefulWidget {
  const AddAppScreen({super.key});

  @override
  State<AddAppScreen> createState() => _AddAppScreenState();
}

class _AddAppScreenState extends State<AddAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: Colors.deepPurple,
              )
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const LogoAndName(),
              const CustomTextFeild(),
              TitleText(CustomText: ConstText().app_Region),
              CustomDropDown(),
              TitleText(CustomText: ConstText().app_Language),
              dropDown(),
              const CheckBoxes(),
              // customButtom(),
              // const SizedBox(
              //   height: 20,
              // )
            ],
          ),
        ],
      ),
    );
  }

  Widget dropDown() {
    String dropdownValue = "German";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
          items: <String>["German", "English"]
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

  Widget customButtom() {
    return Positioned(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
            onPressed: () {
              ButtonFunction().cancelButtonFunction(context);
            },
            child: const Text("Cancel")),
        ElevatedButton(
            onPressed: () {
              ButtonFunction().saveButtonFunction(context);
            },
            child: const Text("Save"))
      ],
    ));
  }
}
