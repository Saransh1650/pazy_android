import 'package:image_picker/image_picker.dart';

class NewAdded{
  var size;
  var createdAt;
  XFile image;

  NewAdded(this.createdAt,this.image, this.size);
}