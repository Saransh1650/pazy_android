import 'dart:ffi';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pazy_android/Model/new_added_struct.dart';

class LogsData extends GetxController{
  
var logMap = RxMap<String, XFile>();

var newImageLog = RxMap<String,XFile>();

var newLogs = RxList<NewAdded>([]);

}