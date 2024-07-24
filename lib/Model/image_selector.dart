import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pazy_android/Model/image_getter.dart';

class ImageSelector extends GetxController{

final image = Get.put(ImageGetter());

  
  
  var isSelected = false;
  var selectedImages = RxList<XFile>([]);

  deleteImages(){
    for(XFile element in selectedImages){
      image.images.remove(element);
    }

    selectedImages = RxList<XFile>([]);
  }
}