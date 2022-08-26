import 'package:flutter/material.dart';
import '../../../data/models/app_details_model.dart';
import '../../../domain/useCases/button_function.dart';

class NewCustomButon extends StatelessWidget {
  final TextEditingController appName;
  final TextEditingController publisherName;
  final String selectedRegion;
  final String selectedLanguage;
  final TextEditingController androidTextEditingController;
  final TextEditingController iosTextEditingController;
  final TextEditingController webTextEditingController;
  const NewCustomButon(
      {super.key,
      required this.appName,
      required this.publisherName,
      required this.selectedRegion,
      required this.selectedLanguage,
      required this.androidTextEditingController,
      required this.iosTextEditingController,
      required this.webTextEditingController});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (appName.text == "" || publisherName.text == "") {
                          const snackBar = SnackBar(
                            content: Text('Please fill the all details'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Data Added')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Enter the proper details')),
                            );
                          }
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
                                  appName: appName.text,
                                  publisherName: publisherName.text,
                                  region: selectedRegion,
                                  language: selectedLanguage,
                                  platform: platforms));
                        }
                      },
                      child: Text("Save")),
                  SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      ButtonFunction().cancelButtonFunction(context);
                    },
                    child: Text('Cancel'),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              OutlinedButton(
                onPressed: () {
                  ButtonFunction().cancelButtonFunction(context);
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                ),
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ),
      
    );
  }
}
