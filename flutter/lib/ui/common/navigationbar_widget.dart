import 'package:flutter/material.dart';
import 'package:kofoos/ui/camera/camera_view.dart';
import 'package:kofoos/ui/home/home_view.dart';
import 'package:kofoos/ui/mypage/mypage_view.dart';
import 'package:kofoos/ui/search/search_view.dart';
import 'package:kofoos/ui/wishlist/wishlist_view.dart';

class MyNavigationBar extends StatefulWidget {
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    SearchView(),
    CameraView(),
    WishlistView(),
    MyPageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: '카메라',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '위시리스트',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}