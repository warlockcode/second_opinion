import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import 'package:second_opinion/screens/Home_Screen.dart';
import 'package:second_opinion/screens/Search.dart';
import 'package:second_opinion/screens/User_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  late List _pages;
  late List _title;
  int _selectedIndex = 0;

  @override
  void initState() {
    _title = [
      'Home Screen',

      'Search Screen',

      'User Screen'
    ];
    _pages = [
      HomeScreen(),

      SearchScreen(),
      UserPage()
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(_title[_selectedIndex]),
      // ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(

        child: Container(
          height: kBottomNavigationBarHeight,
          decoration:
              BoxDecoration(border: Border(top: BorderSide(width: 0.5))),
          child: BottomNavigationBar(
            onTap: _selectedPage,
            elevation: 5,

            backgroundColor: Colors.white,

            selectedItemColor: Colors.purple,
            currentIndex: _selectedIndex,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesome5.home),
                  tooltip: 'Home',
                  label: 'Home'),

              BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(FontAwesome5.search),
                  tooltip: 'Search',
                  label: 'Search'),

              BottomNavigationBarItem(
                  icon: Icon(FontAwesome5.user),
                  tooltip: 'User',
                  label: 'User'),
            ],
          ),
        ),
      ),


    );
  }
}
