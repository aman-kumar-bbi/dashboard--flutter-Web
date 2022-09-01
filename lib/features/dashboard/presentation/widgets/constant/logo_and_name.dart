import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LogoAndName extends StatelessWidget {
  const LogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/bbi_logo.png',
            scale: 5,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            "BB dashboard",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ],
      ),
    );
  }
}
