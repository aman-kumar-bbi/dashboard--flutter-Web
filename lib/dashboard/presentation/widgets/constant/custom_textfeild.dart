import 'package:flutter/material.dart';

class CustomTextFeild extends StatefulWidget {
  const CustomTextFeild({super.key});

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
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: const OutlineInputBorder(borderSide: BorderSide()),
                hintText: 'Name config',
                labelText: 'Name config',
                prefixIcon: Icon(
                  Icons.app_shortcut_outlined,
                  color: Colors.red.shade600,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide()),
                hintText: 'Publisher config',
                labelText: 'Publisher config',
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.red.shade600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
