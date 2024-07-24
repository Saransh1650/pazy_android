import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ViewLog extends GetxController{

  var db = FirebaseFirestore.instance;

  Future viewLog(String url) async {
    await db
        .collection("singhalsaransh40@gmail.com")
        .doc("logs")
        .collection("view log")
        .doc("${Timestamp.now()}")
        .set({"created at": Timestamp.now(), "image": url});
  }

  // Future<List<Map<String, dynamic>>> getViewLogs()async {
  //   List<Map<String, dynamic>> logs = await db
  //      .collection("singhalsaransh40@gmail.com")
  //      .doc("logs")
  //      .collection("view log")
  //      .orderBy("created at", descending: true)
  //      .get()
  //      .then((querySnapshot) => querySnapshot.docs.map((doc) => doc.data()).toList());
  //   return logs;
  // }

}