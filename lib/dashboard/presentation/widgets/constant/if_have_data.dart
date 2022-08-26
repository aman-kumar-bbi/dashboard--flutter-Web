import 'dart:convert';

import 'package:dashboard/dashboard/domain/useCases/filter_data.dart';
import 'package:dashboard/dashboard/presentation/screen/add_app_screen.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../../data/models/app_details_model.dart';
import '../../../domain/useCases/button_function.dart';

class IfHaveData extends StatefulWidget {
  TextEditingController appName;
  TextEditingController publisherName;

  List<AppDetails> appDetails;
  IfHaveData(
      {required this.appDetails,
      required this.appName,
      required this.publisherName,
      });
  @override
  State<IfHaveData> createState() => _IfHaveDataState();
}

class _IfHaveDataState extends State<IfHaveData> {
  
  Query dbref = FirebaseDatabase.instance.ref().child('bb_apps');
  String dropdownValue = 'One';
  String seletedRegion="";
  @override
  Widget build(BuildContext context) {
    filterData(widget.appDetails);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
  
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: height - 72,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              eachRegionBox(context, "German Apps", widget.appName,
                  widget.publisherName, "German Apps"),
              eachRegionBox(context, "European Apps", widget.appName,
                  widget.publisherName,"European Apps"),
              eachRegionBox(context, "American Apps", widget.appName,
                  widget.publisherName,"American Apps")
            ],
          )),
        ),
      ),
    );
  }

  Widget eachRegionBox(
      BuildContext context,
      String regionName,
      TextEditingController appName,
      TextEditingController publisherName,
      String seletedRegion) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - 72;
    return SizedBox(
      height: double.infinity,
      width: width / 3.3,
      child: Column(
        children: [
          SizedBox(
            height: 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(regionName),
                TextButton(
                    onPressed: () {
                     ButtonFunction().homeFloatingActionButton(context,appName,publisherName,seletedRegion);
                    },
                    child: const Text("Add New"))
              ],
            ),
          ),
          Container(
            height: height - 50,
            decoration: BoxDecoration(
              border: Border.all(width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
