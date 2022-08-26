import 'package:dashboard/dashboard/domain/useCases/button_function.dart';
import 'package:dashboard/dashboard/presentation/screen/add_app_screen.dart';
import 'package:flutter/material.dart';

class CheckBoxes extends StatefulWidget {
 final TextEditingController androidTextEditingController;
  final TextEditingController iosTextEditingController;
   final TextEditingController webTextEditingController;

  const CheckBoxes({super.key, required this.androidTextEditingController, required this.iosTextEditingController, required this.webTextEditingController});
  @override
  State<CheckBoxes> createState() => _CheckBoxesState();
}

bool isAndroid = false;
bool isiOS = false;
bool isWebApp = false;
bool isAndroidLink = false;
bool isiOSLink = false;
bool isWebAppLink = false;

class _CheckBoxesState extends State<CheckBoxes> {
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text("Android"),
              value: isAndroid,
              onChanged: (val) {
                setState(() {
                  isAndroid = val!;
                  if (isAndroid == true) {
                    setState(() {
                      isAndroidLink = true;
                    
                    });
                  } else {
                    isAndroidLink = false;
                  }
                });
              }),
          isAndroidLink == true
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 35,
                    child: TextFormField(
                      
                      controller: widget.androidTextEditingController,
                      decoration: InputDecoration(hintText: "Playstore Link"),
                      validator: (value) {
                        if (value == "") {
                          setState(() {
                            isAndroid = false;
                          });
                        }
                      },
                    ),
                  ),
                )
              : SizedBox(),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text("iOS"),
              value: isiOS,
              onChanged: (val) {
                setState(() {
                  isiOS = val!;
                  if (isiOS == true) {
                    setState(() {
                      isiOSLink = true;
                    });
                  } else {
                    isiOSLink = false;
                  }
                });
              }),
          isiOSLink == true
              ? Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 35,
                    child: TextFormField(
                      controller: widget.iosTextEditingController,
                      decoration: InputDecoration(hintText: "App Store Link"),
                    ),
                  ),
                )
              : SizedBox(),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text("Web"),
              value: isWebApp,
              onChanged: (val) {
                setState(() {
                  isWebApp = val!;
                  if (isWebApp == true) {
                    setState(() {
                      isWebAppLink = true;
                    });
                  } else {
                    isWebAppLink = false;
                  }
                });
              }),
          isWebAppLink == true
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 35,
                    child: TextFormField(
                      controller: widget.webTextEditingController,
                      decoration: InputDecoration(hintText: "App Link"),
                    ),
                  ),
                )
              : SizedBox(),

        ],
      ),
    ));
  }

 
}
