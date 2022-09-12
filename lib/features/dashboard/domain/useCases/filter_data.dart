import '../../data/models/app_details_model.dart';

List<AppDetails> filterData(List<AppDetails> wholeDataOfApp, String region) {
  final filtedApps =
      wholeDataOfApp.where((element) => element.region == region).toList();
  return filtedApps;
}
