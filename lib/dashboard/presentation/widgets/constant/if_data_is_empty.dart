import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../domain/useCases/button_function.dart';

class Empty extends StatelessWidget {
  TextEditingController appName;
  TextEditingController publisherName;

  // List<AppDetails> appDetails;
  Empty({required this.appName, required this.publisherName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 600,
          width: double.infinity,
          child: Column(
            children: [
              const Text("It's Empty here"),
              const SizedBox(
                height: 30,
              ),
              const Text("Lets get started by adding some items here !"),
              ElevatedButton(
                  onPressed: () {
                    ButtonFunction().homeFloatingActionButton(
                        context, appName, publisherName, "European Apps");
                  },
                  child: Text("Add App"))
            ],
          ),
        )
      ],
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      // ButtonFunction().homeFloatingActionButton(
      //     context, appName, publisherName, "European Apps");
      //     },
      //     backgroundColor: Colors.red[600],
      //     child: const Icon(Icons.add),
      //   ),
    );
  }
}
