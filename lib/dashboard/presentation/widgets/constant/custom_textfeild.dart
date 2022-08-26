import 'package:flutter/material.dart';

class CustomTextFeild extends StatefulWidget {
  TextEditingController appName;
  TextEditingController publisherName;

  CustomTextFeild({required this.appName, required this.publisherName});

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            TextFormField(
              controller: widget.appName,
              decoration: InputDecoration(
                hintText: 'Name config',
                labelText: 'Name config',
                prefixIcon: Icon(
                  Icons.app_shortcut_outlined,
                  color: Colors.red.shade600,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
           
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: widget.publisherName,
              decoration: InputDecoration(
                hintText: 'Publisher config',
                labelText: 'Publisher config',
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.red.shade600,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
