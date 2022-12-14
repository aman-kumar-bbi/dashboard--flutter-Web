import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../domain/useCases/button_function.dart';

class Empty extends StatelessWidget {


  // List<AppDetails> appDetails;


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
                    ButtonFunction().homeFloatingActionButton("Save",
                        context, "European Apps",null);
                  },
                  child: Text("Add App"))
            ],
          ),
        )
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../../../domain/useCases/button_function.dart';

// class Empty extends StatelessWidget {
//   BuildContext Pcontext;
//   Empty({required this.Pcontext});

//   @override
//   Widget build(BuildContext context) {
//     print("empty");
//     double height = MediaQuery.of(Pcontext).size.height;
//     return Container(
//       color: Colors.indigoAccent,
//       height: height - 200  ,
//       width: double.infinity,
//       child: Center(
//         child: Text("No apps added yet",style: TextStyle(color: Colors.grey,fontSize: 17),),
//       ),
//     );
//   }
// }

