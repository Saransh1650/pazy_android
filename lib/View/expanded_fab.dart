import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:pazy_android/Model/image_getter.dart';

class ExpandedFabButton extends StatelessWidget {
  const ExpandedFabButton({super.key});

  @override
  Widget build(BuildContext context) {
    final image = Get.put(ImageGetter());
    return ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.add, color: Colors.white,),
          fabSize: ExpandableFabSize.regular,
          foregroundColor: Color.fromARGB(249, 9, 73, 11),
          backgroundColor: Color.fromARGB(249, 9, 73, 11),
          shape: const CircleBorder(),
        ),
        closeButtonBuilder: DefaultFloatingActionButtonBuilder(
          child: const Icon(Icons.close,color: Colors.white,),
          fabSize: ExpandableFabSize.small,
          foregroundColor: Color.fromARGB(249, 9, 73, 11),
          backgroundColor: Color.fromARGB(249, 9, 73, 11),
          shape: const CircleBorder(),
        ),

        children: [
          FloatingActionButton.small(
            backgroundColor: Color.fromARGB(249, 9, 73, 11),
            // shape: const CircleBorder(),
            heroTag: null,
            child: const Icon(Icons.photo, color: Colors.white,),
            onPressed: () {
              image.getImageGallery();
            },
            
          ),
          FloatingActionButton.small(
            backgroundColor: Color.fromARGB(249, 9, 73, 11),
            // shape: const CircleBorder(),
            heroTag: null,
            child: const Icon(Icons.camera, color: Colors.white,),
            onPressed: () {
             image.getImageCamera();
            },
          ),
        ],);
  }
}