import 'package:dashboard/dashboard/data/models/app_details_model.dart';

import 'package:dashboard/dashboard/presentation/widgets/constant/check_boxes.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/custom_textfeild.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/drop_downs.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/new_custom_save_and_delete_button.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/title_text_on_add_app_screen.dart';
import 'package:flutter/material.dart';


import '../../data/repository/FirebaseFunction.dart';

class AddAppScreen extends StatefulWidget {
  TextEditingController appName;
  TextEditingController publisherName;
  String seletedRegion;

  AddAppScreen(
      {required this.appName,
      required this.publisherName,
      required this.seletedRegion});

  @override
  State<AddAppScreen> createState() => _AddAppScreenState();
}

late String checkAndroid;
late String checkIos;
late String checkWeb;
// String regionValue = '';
// String regionValueTest = 'Europe';
String languageValue = '';
String languageValueTest = 'English';

class _AddAppScreenState extends State<AddAppScreen> {
  final TextEditingController androidTextEditingController =
      TextEditingController();
  final TextEditingController iosTextEditingController =
      TextEditingController();
  final TextEditingController webTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextFeild(
            appName: widget.appName,
            publisherName: widget.publisherName,
          ),

          CheckBoxes(
            androidTextEditingController: androidTextEditingController,
            iosTextEditingController: iosTextEditingController,
            webTextEditingController: webTextEditingController,
          ),
          NewCustomButon(
            appName: widget.appName,
            publisherName: widget.publisherName,
            selectedRegion: widget.seletedRegion,
            selectedLanguage: languageValueTest,
            androidTextEditingController: androidTextEditingController,
            iosTextEditingController: iosTextEditingController,
            webTextEditingController: webTextEditingController,
          ),
        ],
      ),
    );
  }
}
