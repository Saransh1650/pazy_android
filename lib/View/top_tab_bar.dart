import 'package:flutter/material.dart';
import 'package:pazy_android/View/logs/newly_added_image_log.dart';
import 'package:pazy_android/View/logs/viewed_image_view.dart';

class TopTabBar extends StatelessWidget {
  const TopTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      initialIndex: 1,
      length: 2,
      child: Scaffold(
        
        appBar: AppBar(
          title: const Text(
            'PAZY',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 28),
          ),
          backgroundColor: Color.fromARGB(249, 9, 73, 11),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.view_compact_alt, color: Colors.white,),
              ),
              Tab(
                icon: Icon(Icons.add_a_photo_outlined,
                  color: Colors.white,
                ),
              ),
              
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            ViewedImage(),
            NewAddedImageLog()
            
          ],
        ),
      ),
    );
  }}