import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pazy_android/View/logs/newLogTabs.dart';

class NewAddedImageLog extends StatelessWidget {
  const NewAddedImageLog({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('singhalsaransh40@gmail.com')
            .doc("pic")
            .collection("adding pic")
            .orderBy("created at", descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          final data = snapshot.requireData;

          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              return NewLogTab(
                  createdAt:
                      DateFormat("yyyy-MM-dd HH:mm:ss").format((data.docs[index]["created at"] as Timestamp).toDate()),
                  size:
                      data.docs[index]["size"],
                  image: data.docs[index]["image"]);
            },
          );
        });

   
  }
}
