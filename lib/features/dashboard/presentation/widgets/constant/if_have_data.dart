import 'package:dashboard/features/dashboard/domain/useCases/filter_data.dart';
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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
              eachRegionBox(
                context,
                "German Apps",
                "DE"
              ),
              eachRegionBox(
                context,
                "European Apps",
                "EU"
              ),
              eachRegionBox(
                context,
                "American Apps",
                "US"
              )
            ],
          )),
        ),
      ),
    );
  }

  Widget eachRegionBox(BuildContext context, String regionName,String appLanguage) {
    List filteredList=[];
    if (widget.appDetails!=null) {
     filteredList = filterData(widget.appDetails!, appLanguage);
    }
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
                          "Save", context, appLanguage, null);
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
                const Padding(
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
                ),
                filteredList.length != 0
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            // print("lenght ${filteredList.l}")
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  elevation: 10,
                                  child: InkWell(
                                    onTap: () {
                                      ButtonFunction().homeFloatingActionButton(
                                          "Update",
                                          context,
                                          appLanguage,
                                          filteredList[index]);
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
                                                  filteredList[index].appName,
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
                                                  filteredList[index]
                                                      .publisherName,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(filteredList[index]
                                                            .platform[0]
                                                            .url ==
                                                        ""
                                                    ? ""
                                                    : "Android "),
                                                Text(filteredList[index]
                                                            .platform[1]
                                                            .url ==
                                                        ""
                                                    ? ""
                                                    : "iOS "),
                                                Text(filteredList[index]
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
                        ),
                      )
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
