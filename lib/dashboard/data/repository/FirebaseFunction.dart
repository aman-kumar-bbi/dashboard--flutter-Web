import 'dart:convert';

import 'package:dashboard/dashboard/data/models/app_details_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseFunctions {
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
    print("updating new data");
    var databaseReference = FirebaseDatabase.instance
        .ref("bb_apps")
        .child(details.uid)
        .update(details.toJson());
  }

  Future<List<AppDetails>?> fetchData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("bb_apps").ref;

    DatabaseEvent event = await ref.once();
    print("final event ${event.snapshot.value}");
    final bbAppJson = event.snapshot.value;
    List<AppDetails>? listOfAppDetails;
    if (bbAppJson is Map) {
      listOfAppDetails = bbAppJson.entries
          .map((e) => AppDetails.fromJson(e.key, e.value))
          .toList();
    }
    return listOfAppDetails;
  }
}
