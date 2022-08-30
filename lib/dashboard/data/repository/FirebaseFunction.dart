import 'dart:convert';

import 'package:dashboard/dashboard/data/models/app_details_model.dart';
import 'package:dashboard/dashboard/presentation/screen/home.dart';
import 'package:dashboard/dashboard/presentation/screen/login_page.dart';
import 'package:dashboard/dashboard/presentation/screen/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseFunctions {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  final fb = FirebaseDatabase.instance;
  Future? setData(AppDetails details) {
    final ref = fb.ref().child('bb_apps');
    ref
        .push()
        .set(
          details.toJson(),
        )
        .asStream();
    return null;
  }

  Future delFunction(String uid) async {
    await FirebaseDatabase.instance.ref().child("bb_apps").child(uid).remove();
  }

  Future? updateData(AppDetails details) {
    var databaseReference = FirebaseDatabase.instance
        .ref("bb_apps")
        .child(details.uid)
        .update(details.toJson());
  }

  Future<List<AppDetails>?> fetchData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("bb_apps").ref;

    DatabaseEvent event = await ref.once();

    final bbAppJson = event.snapshot.value;
    List<AppDetails>? listOfAppDetails;
    if (bbAppJson is Map) {
      listOfAppDetails = bbAppJson.entries
          .map((e) => AppDetails.fromJson(e.key, e.value))
          .toList();
    }
    return listOfAppDetails;
  }

  Future logIn(BuildContext context, String email, String password, ) async {
    try {
      print("email ${email.trim()}");
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      var error = e.toString();
      print("erroe is $error");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Some error ocurred")));
      print(e);
    }
  }

     Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}

}
