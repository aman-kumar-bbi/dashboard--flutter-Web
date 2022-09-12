import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/app_details_model.dart';

StreamController myStreamController = StreamController();
Stream myStream = myStreamController.stream.asBroadcastStream();

class SearchList with ChangeNotifier{
  List<AppDetails>? searchBar(
    List<AppDetails> wholeDataOfApp, String searchController) {
  final searchApp = wholeDataOfApp
      .where((element) =>
          element.appName.toLowerCase().startsWith(searchController))
      .toList();
      print("searchApp $searchApp");
      notifyListeners();
  return searchApp;
}

}