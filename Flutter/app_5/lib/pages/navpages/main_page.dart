import 'package:app_5/pages/navpages/bar_item_page.dart';
import 'package:app_5/pages/home_page.dart';
import 'package:app_5/pages/navpages/my_page.dart';
import 'package:app_5/pages/navpages/search_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        // .shifting is default. meaning, on tap, items shift
        backgroundColor: Colors.white,
        onTap: onTap,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            title: Text("Bar"),
            icon: Icon(Icons.bar_chart),
          ),
          BottomNavigationBarItem(
            title: Text("Search"),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text("My"),
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
