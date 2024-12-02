import 'package:flutter/material.dart';

import 'package:imag/Tasks/Imageupload/imageupload.dart';
import 'package:imag/Tasks/provider/homescreen.dart';

import 'Tasks/Getx/getx.dart';

void main() {
  runApp(home());
}

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int _currentIndex = 0;

  final _pages = [
    HomeScreen(),
    GetxCalculator(),
    CustomImagePicker(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: _pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.grey.shade300,
            selectedFontSize: 17,
            unselectedFontSize: 15,
            selectedItemColor: Colors.blue,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetxCalculator()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomImagePicker()),
                );
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Provider'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calculate), label: 'Getx'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.image,
                  ),
                  label: 'Upload'),
            ],
          ),
        ),
      ),
    );
  }
}
