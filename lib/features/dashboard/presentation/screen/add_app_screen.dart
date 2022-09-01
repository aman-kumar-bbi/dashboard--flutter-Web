import 'package:dashboard/features/dashboard/data/models/app_details_model.dart';
import 'package:dashboard/features/dashboard/data/repository/FirebaseFunction.dart';
import 'package:dashboard/features/dashboard/presentation/screen/home.dart';
import 'package:dashboard/features/dashboard/presentation/widgets/constant/check_boxes.dart';
import 'package:dashboard/features/dashboard/presentation/widgets/constant/custom_textfeild.dart';
import 'package:dashboard/features/dashboard/presentation/widgets/constant/new_custom_save_and_delete_button.dart';
import 'package:flutter/material.dart';

import '../../domain/useCases/button_function.dart';

class AddAppScreen extends StatefulWidget {
  String buttonName;
  AppDetails? appDetails;
  String regionName;

  AddAppScreen(
      {super.key,
      required this.buttonName,
      required this.appDetails,
      required this.regionName});

  @override
  State<AddAppScreen> createState() => _AddAppScreenState();
}

class _AddAppScreenState extends State<AddAppScreen> {
  final TextEditingController appNameTextEditingController =
      TextEditingController();
  final TextEditingController publishernameTextEditingController =
      TextEditingController();

  final TextEditingController androidTextEditingController =
      TextEditingController();
  final TextEditingController iosTextEditingController =
      TextEditingController();
  final TextEditingController webTextEditingController =
      TextEditingController();
  @override
  void initState() {
    appNameTextEditingController.text =
        widget.appDetails != null ? widget.appDetails!.appName : "";
    publishernameTextEditingController.text =
        widget.appDetails != null ? widget.appDetails!.publisherName : "";
    androidTextEditingController.text =
        widget.appDetails != null ? widget.appDetails!.platform[0].url : "";
    iosTextEditingController.text =
        widget.appDetails != null ? widget.appDetails!.platform[1].url : "";
    webTextEditingController.text =
        widget.appDetails != null ? widget.appDetails!.platform[2].url : "";
    super.initState();
  }

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
            appName: appNameTextEditingController,
            publisherName: publishernameTextEditingController,
          ),
          CheckBoxes(
            androidTextEditingController: androidTextEditingController,
            iosTextEditingController: iosTextEditingController,
            webTextEditingController: webTextEditingController,
          ),
          Row(
            children: [
              SaveButton(
                onPressed: () {
                  if (appNameTextEditingController.text == "" ||
                      publishernameTextEditingController.text == "") {
                    const snackBar = SnackBar(
                      content: Text('Please fill the all details'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    final platforms = [
                      BBPlatform(
                          operatingSystem: "android",
                          url: androidTextEditingController.text),
                      BBPlatform(
                          operatingSystem: "ios",
                          url: iosTextEditingController.text),
                      BBPlatform(
                          operatingSystem: "web",
                          url: webTextEditingController.text)
                    ];
                    ButtonFunction().saveButtonFunction(
                      context,
                      AppDetails(
                          uid: widget.appDetails == null
                              ? ""
                              : widget.appDetails!.uid,
                          appName: appNameTextEditingController.text,
                          publisherName:
                              publishernameTextEditingController.text,
                          region: widget.regionName,
                          
                          platform: platforms),
                    );
                  }
                },
              ),
              const SizedBox(width: 10,),
              CancelButton(
                onPressed: () => Navigator.pop(
                  context,
                ),
              ),
              Expanded(child: Container()),
              DeleteButton(onPressed: () async {
                await FirebaseFunctions().delFunction(widget.appDetails!.uid);

              

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Home(rebuild: true,)),
                    (Route route) => false);
              }),
            ],
          ),
        ],
      ),
    );
  }
}
