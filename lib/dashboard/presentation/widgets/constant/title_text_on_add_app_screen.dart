import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TitleText extends StatelessWidget {
  final String CustomText;
  const TitleText({super.key, required this.CustomText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [Text(CustomText)],
      ),
    );
  }
}
