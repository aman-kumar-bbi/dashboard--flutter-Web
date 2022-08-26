import 'dart:convert';

import 'package:dashboard/dashboard/data/models/app_details_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseFunctions {
  final fb = FirebaseDatabase.instance;
  Future? setData(AppDetails details) {
    print(details.toJson());
    final ref = fb.ref().child('bb_apps');
    ref
        .push()
        .set(
          details.toJson(),
        )
        .asStream();
    return null;
  }

  Future<List<AppDetails>?> fetchData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("bb_apps").ref;

    DatabaseEvent event = await ref.once();
    print("final event ${event.snapshot.value}");
    final bbAppJson = event.snapshot.value;
    List<AppDetails>? listOfAppDetails;
    if (bbAppJson is List) {
      listOfAppDetails = bbAppJson.map((e) => AppDetails.fromJson(e)).toList();
    }else if(bbAppJson is Map){
      listOfAppDetails=bbAppJson.entries.map((e) => AppDetails.fromJson(e.value)).toList();
    }
    return listOfAppDetails;
  }
}
