import 'package:flutter/material.dart';
import 'package:restaurants/firestore/ui/chats/main_page.dart';
import 'package:restaurants/firestore/ui/screen/admin_home.dart';
import 'package:restaurants/firestore/ui/screen/search_home.dart';

class AppBottomBar extends StatefulWidget {
  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int inx = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: inx,
        onTap: (index) {
          setState(() {
            inx = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
              child: Icon(Icons.home),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AdminHome()),
                );
              },
            ),
            title: Text('home'),
            backgroundColor: Color(0xFF42A5F5),
          ),
          BottomNavigationBarItem(
              icon: InkWell(
                child: Icon(Icons.comment),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => MainPage()),
                  );
                },
              ),
              title: Text('Comment')),
          BottomNavigationBarItem(
              icon: InkWell(
                child: Icon(Icons.search),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SearchHomeScreen()),
                  );
                },
              ),
              title: Text('Search')),
        ]);
  }
}
