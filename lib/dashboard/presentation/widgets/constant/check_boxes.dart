import 'package:flutter/material.dart';

class CheckBoxes extends StatefulWidget {
  final TextEditingController androidTextEditingController;
  final TextEditingController iosTextEditingController;
  final TextEditingController webTextEditingController;

  const CheckBoxes(
      {super.key,
      required this.androidTextEditingController,
      required this.iosTextEditingController,
      required this.webTextEditingController});
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
                  child: SizedBox(
                    height: 45,
                    child: TextFormField(
                      autofocus: true,
                      validator: (value) {
                        if (value == "") {
                          setState(() {
                            isAndroid = false;
                          });
                        }
                      },
                      controller: widget.androidTextEditingController,
                      decoration: const InputDecoration(
                        hintText: 'App store link',
                        labelText: 'App store link',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(width: 0.5),
                        ),
                      ),
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
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 45,
                    child: TextFormField(
                      autofocus: true,
                      validator: (value) {
                        if (value == "") {
                          setState(() {
                            isAndroid = false;
                          });
                        }
                      },
                      controller: widget.iosTextEditingController,
                      decoration: const InputDecoration(
                        hintText: 'App store link',
                        labelText: 'App store link',
                        focusedBorder:  OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(width: 0.5),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text("Web"),
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
                  child: SizedBox(
                    height: 45,
                    child:  TextFormField(
                      autofocus: true,
                      validator: (value) {
                        if (value == "") {
                          setState(() {
                            isAndroid = false;
                          });
                        }
                      },
                      controller: widget.webTextEditingController,
                      decoration: const InputDecoration(
                        hintText: 'App store link',
                        labelText: 'App store link',
                        focusedBorder:  OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(width: 0.5),
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    ));
  }
}
