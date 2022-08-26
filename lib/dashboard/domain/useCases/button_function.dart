import 'package:dashboard/dashboard/data/models/app_details_model.dart';
import 'package:dashboard/dashboard/data/repository/FirebaseFunction.dart';
import 'package:dashboard/dashboard/presentation/screen/add_app_screen.dart';
import 'package:dashboard/dashboard/presentation/screen/home.dart';
import 'package:flutter/material.dart';

class ButtonFunction {
  void cancelButtonFunction(BuildContext context) {
    Navigator.pop(
      context,
    );
  }

  homeFloatingActionButton(BuildContext context, TextEditingController appName,
      TextEditingController publisherName, String selectedRegion) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Add New apps'),
        content: SizedBox(
          width: 650,
          height: 700,
          child: AddAppScreen(
            appName: appName,
            publisherName: publisherName,
            seletedRegion: selectedRegion,
          ),
        ),
      ),
    );
  }

  saveButtonFunction(
    BuildContext context,
    AppDetails appDetails,
  ) async {
    await FirebaseFunctions().setData(appDetails);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => Home(
                rebuild: true,
              )),
    );
  }
}
