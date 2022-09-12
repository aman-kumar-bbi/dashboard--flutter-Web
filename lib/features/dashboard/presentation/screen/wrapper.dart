import 'package:dashboard/features/dashboard/presentation/screen/home.dart';
import 'package:dashboard/features/dashboard/presentation/screen/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            
            return Home();
          } else {
            return Home();
          }
        });
  }
}
