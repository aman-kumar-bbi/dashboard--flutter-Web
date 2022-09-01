import 'package:dashboard/features/dashboard/data/repository/FirebaseFunction.dart';
import 'package:dashboard/features/dashboard/presentation/screen/home.dart';
import 'package:flutter/material.dart';

import '../widgets/constant/logo_and_name.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                LogoAndName(),
              ],
            ),
          ),
        ),
        
      ),
      body: Form(
        child: Center(
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 300,
              width: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Enter Email",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          FirebaseFunctions().logIn(
                            context,
                               emailController.text,
                               passwordController.text);
                          
                        },
                        child: Text("Login"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
