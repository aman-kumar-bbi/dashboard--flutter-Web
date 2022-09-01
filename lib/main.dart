
import 'package:dashboard/features/dashboard/presentation/screen/login_page.dart';
import 'package:dashboard/features/dashboard/presentation/screen/wrapper.dart';
import 'package:dashboard/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/dashboard/data/repository/FirebaseFunction.dart';
import 'features/dashboard/presentation/screen/home.dart';

Future main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BB dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Wrapper(),
    );
  }
}
