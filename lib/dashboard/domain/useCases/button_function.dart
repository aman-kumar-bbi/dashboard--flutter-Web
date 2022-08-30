import 'package:dashboard/dashboard/data/models/app_details_model.dart';
import 'package:dashboard/dashboard/data/repository/FirebaseFunction.dart';
import 'package:dashboard/dashboard/presentation/screen/add_app_screen.dart';
import 'package:dashboard/dashboard/presentation/screen/home.dart';
import 'package:flutter/material.dart';

class ButtonFunction {
  Future? cancelButtonFunction(BuildContext context) async {
    Navigator.pop(
      context,
    );
  }

  homeFloatingActionButton(String buttonName, BuildContext context,
      String region, AppDetails? appDetails) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Add New apps'),
        content: SizedBox(
          width: 650,
          height: 700,
          child: AddAppScreen(
            buttonName: buttonName,
            appDetails: appDetails,
            regionName: region,
          ),
        ),
      ),
    );
  }

  saveButtonFunction(
    BuildContext context,
    AppDetails appDetails,
  ) async {
    appDetails.uid == ""
        ? await FirebaseFunctions().setData(appDetails)
        : await FirebaseFunctions().updateData(appDetails);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => Home(
                  rebuild: true,
                )),
        (Route route) => false);
  }
}
