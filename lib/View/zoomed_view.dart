
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pazy_android/Model/Firebase/image_data.dart';
import 'package:pazy_android/Model/image_getter.dart';
import 'package:share_plus/share_plus.dart';

class ZoomedView extends StatelessWidget {
  final String image,docId;
  const ZoomedView({super.key, required this.image, required this.docId});

  @override
  Widget build(BuildContext context) {
ImageData data = Get.put(ImageData());
  ImageGetter decryptedImage = Get.put(ImageGetter());  
    return Scaffold(
      appBar: AppBar(title: const Text("Image", style: TextStyle(fontSize: 15),)),
      body: Column(
        children: [
          Expanded(
            child: Image.file(decryptedImage.getDecryptedPath(image), fit: BoxFit.fill,),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: [
                IconButton(onPressed: ()async{
                  final result = await Share.shareXFiles([XFile(decryptedImage.getDecryptedPath(image).path)]);

                  if (result.status == ShareResultStatus.success) {
                        print('Shared!');

                      }

                }, icon: const Icon(Icons.share, size: 35,)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.info,size: 35)),
                  IconButton(onPressed: () async {
                    await data.deleteData(docId);
                    Get.back();
                  }, icon: const Icon(Icons.delete, size: 35,))
              ],
            ),
          )
        ],
      ),
    );
  }
}
