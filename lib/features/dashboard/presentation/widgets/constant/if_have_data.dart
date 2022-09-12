import 'package:dashboard/features/dashboard/domain/useCases/filter_data.dart';
import 'package:dashboard/features/dashboard/domain/useCases/search_bar.dart';
import 'package:dashboard/features/dashboard/presentation/widgets/each_region_box.dart';
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
  print("build");
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
              EachRegionBox(
                  appLanguage: "De",
                  context: context,
                  regionName: "German Apps",
                  searchController: germanySearchController,
                  filteredList: FilterListAccouringToItRegion("DE"),defultList: FilterListAccouringToItRegion("DE"),),
              EachRegionBox(
                  appLanguage: "Eu",
                  context: context,
                  regionName: "European Apps",
                  searchController: europeSearchController,
                  filteredList: FilterListAccouringToItRegion("EU"),defultList: FilterListAccouringToItRegion("EU"),),
              EachRegionBox(
                  appLanguage: "US",
                  context: context,
                  regionName: "American Apps",
                  searchController: americaSearchController,
                  filteredList: FilterListAccouringToItRegion("US"),defultList: FilterListAccouringToItRegion("US"),)
            ],
          )),
        ),
      ),
    );
  }
}
