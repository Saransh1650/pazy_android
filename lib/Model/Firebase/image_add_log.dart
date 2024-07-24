import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageAddLog extends GetxController{
  var db = FirebaseFirestore.instance;

  Future addLog(String url) async {
    await db
        .collection("singhalsaransh40@gmail.com")
        .doc("logs")
        .collection("add log")
        .doc("${Timestamp.now()}")
        .set({"created at": Timestamp.now(), "image": url, "size" : ""});
  }
}