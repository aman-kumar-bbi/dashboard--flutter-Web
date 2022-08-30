import 'package:dashboard/dashboard/data/repository/FirebaseFunction.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/if_data_is_empty.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/if_have_data.dart';
import 'package:dashboard/dashboard/presentation/widgets/constant/logo_and_name.dart';
import 'package:flutter/material.dart';

import '../../domain/useCases/button_function.dart';

class Home extends StatefulWidget {
  bool? rebuild = false;
  Home({this.rebuild});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    widget.rebuild == true ? setState(() {}) : null;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: SizedBox(
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: LogoAndName()),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseFunctions().signOut();
                },
                icon: const Icon(Icons.logout_outlined))
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                future: FirebaseFunctions().fetchData(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData == true) {
                    return IfHaveData(
                      appDetails: snapshot.data!,
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                        child: Center(child: CircularProgressIndicator()));
                  } else {
                    return IfHaveData(
                      appDetails: snapshot.data,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
