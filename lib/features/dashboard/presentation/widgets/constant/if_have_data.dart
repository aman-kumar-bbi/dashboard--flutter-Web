import 'dart:async';

import 'package:dashboard/features/dashboard/domain/useCases/filter_data.dart';
import 'package:dashboard/features/dashboard/domain/useCases/search_bar.dart';
import 'package:flutter/material.dart';
import '../../../data/models/app_details_model.dart';
import '../../../domain/useCases/button_function.dart';

class IfHaveData extends StatefulWidget {
  List<AppDetails>? appDetails;
  IfHaveData({
    required this.appDetails,
  });
  @override
  State<IfHaveData> createState() => _IfHaveDataState();
}

class _IfHaveDataState extends State<IfHaveData> {
  final TextEditingController germanySearchController = TextEditingController();
  final TextEditingController europeSearchController = TextEditingController();
  final TextEditingController americaSearchController = TextEditingController();
  List<AppDetails>? filteredList = [];

  List<AppDetails>? FilterListAccouringToItRegion(String appLanguage) {
    if (widget.appDetails != null) {
      filteredList = filterData(widget.appDetails!, appLanguage);
     
      return filteredList;
    } else {
      filteredList;
    }
  }
 

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: height - 72,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              eachRegionBox(context, "German Apps", "DE",
                  germanySearchController, FilterListAccouringToItRegion("DE")),
              eachRegionBox(context, "European Apps", "EU",
                  europeSearchController, FilterListAccouringToItRegion("EU")),
              eachRegionBox(
                  context, "American Apps", "US", americaSearchController,FilterListAccouringToItRegion("US"))
            ],
          )),
        ),
      ),
    );
  }

  Widget eachRegionBox(
      BuildContext context,
      String regionName,
      String appLanguage,
      TextEditingController searchController,
      List<AppDetails>? filterList) {
    // List<AppDetails>? filteredList = [];
    // if (widget.appDetails != null) {
    //   filteredList = filterData(widget.appDetails!, appLanguage);
    // }
    List<AppDetails>? searchList = filterList;
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(regionName),
                TextButton(
                    onPressed: () {
                      ButtonFunction().homeFloatingActionButton(
                          "Save", context, appLanguage, null, false);
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
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      List<AppDetails>? searchListByUser = SearchList()
                          .searchBar(filteredList!, searchController.text);
                      setState(() {
                        print("searchListByUser $searchListByUser");
                        searchList = searchListByUser;
                        print("filteredList onchange $filteredList");
                      });
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                ),
                filteredList!.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                        itemCount: searchList!.length,
                        itemBuilder: (context, index) {
                          print("filteredList listview $filteredList");
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                elevation: 10,
                                child: InkWell(
                                  onTap: () {
                                    ButtonFunction().homeFloatingActionButton(
                                        "Update",
                                        context,
                                        appLanguage,
                                        searchList![index],
                                        true);
                                  },
                                  child: Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                searchList![index].appName,
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const CircleAvatar(
                                                radius: 5,
                                                backgroundColor: Colors.green,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                searchList![index].publisherName,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(searchList![index]
                                                          .platform[0]
                                                          .url ==
                                                      ""
                                                  ? ""
                                                  : "Android "),
                                              Text(searchList![index]
                                                          .platform[1]
                                                          .url ==
                                                      ""
                                                  ? ""
                                                  : "iOS "),
                                              Text(searchList![index]
                                                          .platform[2]
                                                          .url ==
                                                      ""
                                                  ? ""
                                                  : "Web ")
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ));
                        },
                      ))
                    : SizedBox(
                        height: height - 200,
                        width: double.infinity,
                        child: const Center(
                          child: Text(
                            "No apps added yet",
                            style: TextStyle(color: Colors.grey, fontSize: 17),
                          ),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
