
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:pazy_android/Model/image_getter.dart';

class LogTabs extends StatelessWidget {
  final String title;
  final String image;
  LogTabs({super.key, required this.title, required this.image});
ImageGetter decryptedImage = Get.put(ImageGetter());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Viewed at $title"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(
                decryptedImage.getDecryptedPath(image),
                height: 80,
                width: 80,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
