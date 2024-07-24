import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pazy_android/Model/encryption/encryption.dart';
import 'package:pazy_android/Model/logs_data.dart';

import 'Firebase/image_data.dart';

class ImageGetter extends GetxController {



  var images = RxList<XFile>([]);
  final ImagePicker picker = ImagePicker();
  LogsData logs = Get.put(LogsData());
  ImageData data = Get.put(ImageData());

  Future getImageGallery() async {
    images.value = await picker.pickMultiImage();

    for (XFile element in images) {

      String path = EncryptData.encrypt_file(element.path);
      int size = File(element.path).lengthSync();
      //  List<dynamic> metaData = await _uploadImageToFirebase(element);

      //  String url = metaData[0];
      // var size = metaData[1];

      // await data.addData(url, size);
     // await encryptAndUploadImage(File(element.path));
      // data.addData(imageBytestoString, "10");

      data.addData(path, size);
    }

    print(images);
  }

    File getDecryptedPath(String encryptedPath){
      return File(EncryptData.decrypt_file(encryptedPath));
    }


  // Future<List<dynamic>> _uploadImageToFirebase(XFile image) async {
  //   final FirebaseStorage _storage = FirebaseStorage.instance;
  //   final String fileName = 'images/${image.path}.jpg';
  //   final Reference ref = _storage.ref().child(fileName);
  //   String encrypted_file_path = EncryptData.encrypt_file(image.path);
  //   final UploadTask task = ref.putFile(File(encrypted_file_path));

  //   final TaskSnapshot snapshot = await task.whenComplete(() => null);
  //   var downloadUrl = await snapshot.ref.getDownloadURL();
  //   var size = await snapshot.ref.getMetadata();

  //   // Add the download URL to Firestore
  //   return [downloadUrl, size.size.toString()];
  // }

  // Uint8List encryptData(Uint8List data) {
  //   final key = encrypt.Key.fromLength(32); // 256-bit key
  //   final iv = encrypt.IV.fromLength(16); // 128-bit IV

  //   final encrypter = encrypt.Encrypter(encrypt.AES(key));
  //   final encrypted = encrypter.encryptBytes(data, iv: iv);
  //   return encrypted.bytes;
  // }



//   Future<void> encryptAndUploadImage(File imageFile) async {
//     try {
//       // Read image file as bytes
//       final bytes = await imageFile.readAsBytes();

//       // Encrypt the bytes
//       final encryptedBytes = encryptData(bytes);

//       // Upload encrypted bytes to Firebase Storage
//       final storageRef = FirebaseStorage.instance
//           .ref()
//           .child('encrypted_images/${imageFile.uri.pathSegments.last}');
//       await storageRef.putData(encryptedBytes);

//       print('Encrypted image uploaded successfully');
//     } catch (e) {
//       print('Error encrypting or uploading image: $e');
//     }
//   }

//   List<int> decryptData(Uint8List data) {
//     final key = encrypt.Key.fromLength(32); // 256-bit key
//     final iv = encrypt.IV.fromLength(16);
//     final encrypter = encrypt.Encrypter(encrypt.AES(key));
//     final decrypted = encrypter.decryptBytes(encrypt.Encrypted(data), iv: iv);
//     return decrypted;
//   }

//   Future<List<int>?> downloadAndDecryptImage(String filePath) async {
//     try {
//       // Download encrypted bytes from Firebase Storage
//       final storageRef = FirebaseStorage.instance.ref().child(
//           "encrypted_images/image_picker_48D70F41-998F-452E-A208-5E9B64133185-65941-0000039E8A19CDB3.jpg");
//       final encryptedBytes = await storageRef.getData();

//       if (encryptedBytes != null) {
//         // Decrypt the bytes
//         final decryptedBytes = decryptData(encryptedBytes);
//         print(decryptedBytes);
//         return decryptedBytes;
//       }
//     } catch (e) {
//       print('Error downloading or decrypting image: $e');
//     }
//     return null;
//   }

//   decryptImage(var data) async {
//     final key = encrypt.Key.fromLength(32); // Use a secure key
//     final iv = encrypt.IV.fromLength(16); // Initialization Vector
//     final encrypter = encrypt.Encrypter(encrypt.AES(key));
//     Uint8List myUint8List = utf8.encode(data);

//     final decryptedBytes =
//         encrypter.decryptBytes((encrypt.Encrypted(myUint8List)), iv: iv);
//     final decryptedString = utf8.decode(decryptedBytes);
//     print("Decrypted String: $decryptedString");
//     return decryptedBytes;
//   }

// // Future<List<int>?> downloadAndDecryptImage(String filePath) async {
// //     try {
// //       final storageRef = FirebaseStorage.instance.ref().child(filePath);
// //       final encryptedBytes =
// //           await storageRef.getData(); // Get encrypted data as bytes
// // print(encryptedBytes);
// //       if (encryptedBytes != null) {
// //         // Decryption setup
// //         final key =
// //             encrypt.Key.fromLength(32); // Same key as used for encryption
// //         final iv = encrypt.IV.fromLength(16); // Same IV as used for encryption
// //         final encrypter = encrypt.Encrypter(encrypt.AES(key));

// //         // Decrypt the bytes
// //         final decryptedBytes =
// //             encrypter.decryptBytes(encrypt.Encrypted(encryptedBytes), iv: iv);
// // print(decryptedBytes);
// //         return decryptedBytes;
// //       }
// //     } catch (e) {
// //       print('Error downloading or decrypting image: $e');
// //     }
// //     return null;
// //   }

//   // Future<Uint8List> downloadAndDecryptImage(String url) async {
//   //   // Download the file
//   //   final http.Response response = await http.get(Uri.parse(url));
//   //   Uint8List encryptedBytes = response.bodyBytes;
//   //   print("encryptedBytes ::" + encryptedBytes.toString());

//   //   var decrypted = await EncryptData.decrypt_file(encryptedBytes);
//   //   print("decrypted ::" + decrypted.toString());
//   //   // Decrypt the bytes
//   //   // final aesKey = encrypt.Key.fromUtf8(key);
//   //   // final iv = encrypt.IV.fromLength(16); // Initialization vector
//   //   // final encrypter = encrypt.Encrypter(encrypt.AES(aesKey));
//   //   // final decrypted = encrypter.decryptBytes(encrypt.Encrypted(encryptedBytes), iv: iv);

//   //   return decrypted;
//   // }

  Future getImageCamera() async {
    final XFile? camImage = await picker.pickImage(source: ImageSource.camera);
    for (XFile element in images) {}

    print(camImage);
  }
}
