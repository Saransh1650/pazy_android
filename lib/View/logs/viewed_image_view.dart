import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:intl/intl.dart';
import 'package:pazy_android/Model/logs_data.dart';
import 'package:pazy_android/View/log_tabs.dart';

class ViewedImage extends StatelessWidget {
  const ViewedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('singhalsaransh40@gmail.com')
            .doc("logs")
            .collection("view log")
            .orderBy("created at", descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          final data = snapshot.requireData;

          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              return LogTabs(
                  title: DateFormat("yyyy-MM-dd HH:mm:ss").format((data.docs[index]["created at"] as Timestamp).toDate()),
                  image: data.docs[index]["image"]);
            },
          );
        });

    // ListView.builder(
    //     itemCount: logs.logMap.length,
    //     itemBuilder: (context, index) {
    //       return LogTabs(
    //           title: logs.logMap.keys.elementAt(logs.logMap.length - index - 1),
    //           image:
    //               logs.logMap.values.elementAt(logs.logMap.length - index - 1));
    //     },
    //   );
  }
}
