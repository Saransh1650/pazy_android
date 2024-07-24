import 'package:flutter/material.dart';
import 'package:pazy_android/View/top_tab_bar.dart';

class Logs extends StatelessWidget {
  const Logs({super.key});

  @override
  Widget build(BuildContext context) {
   
    

    return const Scaffold(

      body: TopTabBar()
          

      // body: ListView.builder(
      //   itemCount: logs.logMap.length,
      //   itemBuilder: (context, index) {
      //     return LogTabs(
      //         title: logs.logMap.keys.elementAt(logs.logMap.length - index - 1),
      //         image:
      //             logs.logMap.values.elementAt(logs.logMap.length - index - 1));
      //   },
      // ),
    );
  }
}
