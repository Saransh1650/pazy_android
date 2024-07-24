import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pazy_android/Model/encryption/encryption.dart';
import 'package:pazy_android/Model/image_getter.dart';
import 'package:pazy_android/Model/image_selector.dart';
import 'package:pazy_android/View/expanded_fab.dart';
import 'package:pazy_android/View/file_view.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final select = Get.put(ImageSelector());
    final image = Get.put(ImageGetter());
    return Scaffold(
      appBar: AppBar(
        
        actions: [
          IconButton(
            color: select.selectedImages.isNotEmpty
                ? Colors.white
                : Colors.transparent,
            onPressed: () {
              select.deleteImages();
              image.onInit();
            },
            icon: Icon(Icons.delete),
          )
        ],
        title: const Text(
          'PAZY',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 28),
        ),
        backgroundColor: Color.fromARGB(249, 9, 73, 11),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: const ExpandedFabButton(),

//      Reduced the use of SetState by using Obx

      body: 
        StreamBuilder(
        stream: FirebaseFirestore.instance.collection('singhalsaransh40@gmail.com').doc("pic").collection("adding pic").orderBy("created at",descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          final data = snapshot.requireData;

          return 
         GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of columns
            ),
            itemCount: data.size,
            itemBuilder: (context, index) {
              
              return FileView(

                image:  data.docs[index]["image"] ,
                docId: data.docs[index].id,
              );
            });
  }),
    );
  }
}
