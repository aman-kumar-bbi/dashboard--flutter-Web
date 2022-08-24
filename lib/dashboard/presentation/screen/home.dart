import 'package:dashboard/dashboard/presentation/screen/add_app_screen.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/if_data_is_empty.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/if_have_data.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/logo_and_name.dart';
import 'package:flutter/material.dart';

import '../../../core/materialUi.dart';
import '../../domain/useCases/ButtonFunction.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ButtonFunction().homeFloatingActionButton(context);
          },
          backgroundColor: Colors.red[600],
          child: const Icon(Icons.add),
        ),
        body: Stack(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: Colors.deepPurple,
              )
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   const SizedBox(
                    height: 20,
                  ),
                  const LogoAndName(),
                
                  // Empty(),
                  IfHaveData(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

