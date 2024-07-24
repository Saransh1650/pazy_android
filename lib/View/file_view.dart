import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazy_android/Model/Firebase/image_view_log.dart';
import 'package:pazy_android/Model/image_getter.dart';
import 'package:pazy_android/Model/image_selector.dart';
import 'package:pazy_android/View/zoomed_view.dart';

class FileView extends StatefulWidget {
  final String image, docId;
  FileView({super.key, required this.image, required this.docId});

  @override
  State<FileView> createState() => _FileViewState();
}



class _FileViewState extends State<FileView> {




ImageGetter path = Get.put(ImageGetter());
  
  @override
  Widget build(BuildContext context) {
    
    ViewLog logs = Get.put(ViewLog());
    return InkWell(
      onTap: () {
        setState(() {
          
            Get.to(
                () => ZoomedView(
                      image: widget.image,
                      docId: widget.docId,
                    ),
                popGesture: true,
                transition: Transition.zoom);
            logs.viewLog(widget.image);
         
          
        });
      },
      
      child: 
            Image.file(path.getDecryptedPath(widget.image), fit: BoxFit.fill,) // Display image
          
    );
  }
}
