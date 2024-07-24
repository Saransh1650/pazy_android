import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazy_android/Model/image_selector.dart';
import 'package:pazy_android/View/home.dart';
import 'package:pazy_android/View/logs.dart';





 class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() =>
      _MainScreenState();
}

class _MainScreenState
    extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    const Logs()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check),
            label: 'Logs',
          ),
          
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(249, 9, 73, 11),
        onTap: _onItemTapped,
      ),
    );
    }
    }