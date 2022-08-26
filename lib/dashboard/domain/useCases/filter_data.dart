import 'dart:convert';

import '../../data/models/app_details_model.dart';

filterData(List<AppDetails>? wholeDataOfApp) {
  List listOfEuropeApp = [];

  wholeDataOfApp!.forEach(
    (element) {
      listOfEuropeApp.add(element.toJson());
    },
  );
  // listOfEuropeApp.forEach((element) {
  //   listOfEuropeApp.add(element["region"]=="European Apps");
  // },);
   print("whole data ${listOfEuropeApp.length}");
  // return listOfEuropeApp;
}
