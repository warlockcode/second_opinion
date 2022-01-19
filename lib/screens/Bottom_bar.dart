import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:second_opinion/screens/Cart_screen.dart';
import 'package:second_opinion/screens/Feed_screen.dart';
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
  int _selectedIndex = 4;

  @override
  void initState() {
    _title = [
      'Home Screen',
      'Feed Screen',
      'Search Screen',
      'Cart Screen',
      'User Screen'
    ];
    _pages = [
      HomeScreen(),
      FeedScreen(),
      SearchScreen(),
      CartScreen(),
      UserScreen(),
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
        notchMargin: 2,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: kBottomNavigationBarHeight,
          decoration:
              BoxDecoration(border: Border(top: BorderSide(width: 0.5))),
          child: BottomNavigationBar(
            onTap: _selectedPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).unselectedWidgetColor,
            selectedItemColor: Colors.purple,
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesome5.home),
                  tooltip: 'Home',
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesome5.rss), tooltip: 'Feed', label: 'Feed'),
              BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  tooltip: 'Search',
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesome5.shopping_cart),
                  tooltip: 'Cart',
                  label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesome5.user),
                  tooltip: 'User',
                  label: 'User'),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          tooltip: 'Search',
          elevation: 5,
          child: Icon(FontAwesome5.search),
          onPressed: () {
            setState(() {
              _selectedIndex = 2;
            });
          },
        ),
      ),
    );
  }
}
