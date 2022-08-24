import 'package:dashboard/dashboard/presentation/screen/add_app_screen.dart';
import 'package:flutter/material.dart';

class ButtonFunction {
  void saveButtonFunction(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Data Saved"),
    ));
    Navigator.pop(
      context,
    );
  }

  void cancelButtonFunction(BuildContext context) {
    Navigator.pop(
      context,
    );
  }

  void homeFloatingActionButton(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Add New apps'),
        content: const SizedBox(
          width: 650,
          height: 600,
          child: AddAppScreen(),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
