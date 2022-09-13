import 'package:flutter/material.dart';
import '../../../data/models/app_details_model.dart';
import '../../../domain/useCases/button_function.dart';
import '../../../domain/useCases/filter_data.dart';
import '../../../domain/useCases/search_bar.dart';

class EachRegionBox extends StatefulWidget {
  final BuildContext context;
  final String regionName;
  final String appLanguage;
  final TextEditingController searchController;
  List<AppDetails>? filteredList;
  List<AppDetails>? defultList;


  EachRegionBox(
      {required this.appLanguage,
      required this.context,
      required this.regionName,
      required this.searchController,
      required this.filteredList,
      required this.defultList,
      });

  @override
  State<EachRegionBox> createState() => _EachRegionBoxState();
}

class _EachRegionBoxState extends State<EachRegionBox> {
  @override
  Widget build(BuildContext context) {
 

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
                Text(widget.regionName),
                TextButton(
                    onPressed: () {
                      ButtonFunction().homeFloatingActionButton(
                          "Save", context, widget.appLanguage, null, false);
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
                    controller: widget.searchController,
                    onChanged: (value) {
                      setState(() {
                        List<AppDetails>? searchListByUser = SearchList()
                            .searchBar(widget.filteredList!,
                                widget.searchController.text);
                        widget.filteredList = searchListByUser;
                        if (widget.searchController.text.isNotEmpty) {
                          widget.filteredList = searchListByUser;
                        } else {
                          widget.filteredList = widget.defultList;
                        }
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
                widget.filteredList?.length != null
                    ? Expanded(
                        child: ListView.builder(
                        itemCount: widget.filteredList!.length,
                        itemBuilder: (context, index) {
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
                                        widget.appLanguage,
                                        widget.filteredList![index],
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
                                                widget.filteredList![index]
                                                    .appName,
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
                                                widget.filteredList![index]
                                                    .publisherName,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(widget.filteredList![index]
                                                          .platform[0].url ==
                                                      ""
                                                  ? ""
                                                  : "Android "),
                                              Text(widget.filteredList![index]
                                                          .platform[1].url ==
                                                      ""
                                                  ? ""
                                                  : "iOS "),
                                              Text(widget.filteredList![index]
                                                          .platform[2].url ==
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
