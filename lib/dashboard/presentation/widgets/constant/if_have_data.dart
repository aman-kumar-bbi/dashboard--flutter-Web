import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';


class IfHaveData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ExpandablePanel(
            header: Row(
              children: [
                Image.asset(
                  'assets/europe_flag.png',
                  scale: 7,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "European app",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            collapsed:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                ExpandablePanel(
                  header: Text("German Apps"),
                  collapsed: ListTile(leading: Icon(Icons.add_task_sharp),title: Text("App Name"),subtitle: Text("Publisher Name"),),
                  expanded: Text("", softWrap: true, ),
                
                  ),
                  ExpandablePanel(
                  header: Text("English Apps"),
                  collapsed: ListTile(leading: Icon(Icons.add_task_sharp),title: Text("App Name"),subtitle: Text("Publisher Name"),),
                  expanded: Text("", softWrap: true, ),
                
                  ),
              ],)
            ),
            expanded: Text(""),
            
          ),
          SizedBox(height: 20,),
          ExpandablePanel(
            header: Row(
              children: [
                Image.asset(
                  'assets/USA_flag.png',
                  scale: 2,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "American app",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            collapsed:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                
                  ExpandablePanel(
                  header: Text("English Apps"),
                  collapsed: ListTile(leading: Icon(Icons.add_task_sharp),title: Text("App Name"),subtitle: Text("Publisher Name"),),
                  expanded: Text("", softWrap: true, ),
                
                  ),
              ],)
            ),
            expanded: Text(""),
            
          )
        ],
      ),
    );
  }
}
