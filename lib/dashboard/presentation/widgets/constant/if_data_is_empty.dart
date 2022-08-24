import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          Text("It's Empty here"),
          SizedBox(height: 30,),
          Text("Lets get started by adding some items here !"),
        ],
      ),
    );
  }
}
