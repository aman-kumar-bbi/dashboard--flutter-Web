import 'package:dashboard/features/dashboard/data/repository/FirebaseFunction.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../data/models/app_details_model.dart';
import '../../../domain/useCases/button_function.dart';

// class NewCustomButon extends StatefulWidget {
//   final String buttonName;
//   final TextEditingController appName;
//   final TextEditingController publisherName;

//   final String selectedLanguage;
//   final TextEditingController androidTextEditingController;
//   final TextEditingController iosTextEditingController;
//   final TextEditingController webTextEditingController;
//   final String? uid;

//   const NewCustomButon(
//       {super.key,
//       required this.buttonName,
//       required this.appName,
//       required this.publisherName,
//       required this.selectedLanguage,
//       required this.androidTextEditingController,
//       required this.iosTextEditingController,
//       required this.webTextEditingController,
//       this.uid});

//   @override
//   State<NewCustomButon> createState() => _NewCustomButonState();
// }

// class _NewCustomButonState extends State<NewCustomButon> {
//   @override
//   Widget build(BuildContext context) {
//     final _formKey = GlobalKey<FormState>();
//     return Form(
//       key: _formKey,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       if (widget.appName.text == "" ||
//                           widget.publisherName.text == "") {
//                         const snackBar = SnackBar(
//                           content: Text('Please fill the all details'),
//                         );
//                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                       } else {
//                         if (_formKey.currentState!.validate()) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text('Data Added')),
//                           );
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                                 content: Text('Enter the proper details')),
//                           );
//                         }
//                         final platforms = [
//                           BBPlatform(
//                               operatingSystem: "android",
//                               url: widget.androidTextEditingController.text),
//                           BBPlatform(
//                               operatingSystem: "ios",
//                               url: widget.iosTextEditingController.text),
//                           BBPlatform(
//                               operatingSystem: "web",
//                               url: widget.webTextEditingController.text)
//                         ];
//                         ButtonFunction().saveButtonFunction(
//                             context,
//                             AppDetails(
//                                 uid: widget.uid ?? "",
//                                 appName: widget.appName.text,
//                                 publisherName: widget.publisherName.text,
//                                 region: "",
//                                 language: widget.selectedLanguage,
//                                 platform: platforms),
//                             );
//                       }
//                     },
//                     child: Text(widget.buttonName)),
//                 const SizedBox(
//                   width: 10,
//                 ),
//     OutlinedButton(
//       onPressed: () {
//         ButtonFunction().cancelButtonFunction(context);
//       },
//       child: Text('Cancel'),
//       style: OutlinedButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(
//             8,
//           ),
//         ),
//       ),
//     )
//   ],
// ),
// OutlinedButton(
//   onPressed: () async {
//     await FirebaseFunctions().delFunction(widget.uid!);
//     setState(() {
//       ButtonFunction().cancelButtonFunction(context);
//     });
//   },
//   style: OutlinedButton.styleFrom(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(
//         8,
//       ),
//     ),
//   ),
//   child: const Text(
//     'Delete',
//     style: TextStyle(color: Colors.red),
//   ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class SaveButton extends StatelessWidget {
  final Function()? onPressed;
  const SaveButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text("Save"));
  }
}

class CancelButton extends StatelessWidget {
  final Function()? onPressed;
  const CancelButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text("Cancel"),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  final Function()? onPressed;
  const DeleteButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text("Delete",style: TextStyle(color: Colors.red),),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
      ),
    );
  }
}
