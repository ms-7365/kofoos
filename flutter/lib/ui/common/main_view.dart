import 'package:flutter/material.dart';
import 'package:kofoos/ui/camera/camera_view.dart';
import 'package:kofoos/ui/common/appbar_widget.dart';
import 'package:kofoos/ui/home/home_view.dart';
import 'package:kofoos/ui/mypage/mypage_view.dart';
import 'package:kofoos/ui/search/search_view.dart';
import 'package:kofoos/ui/wishlist/wishlist_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeView(),
    SearchView(),
    CameraView(),
    WishlistView(),
    MyPageView(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECECEC),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        unselectedItemColor: Color(0xffCACACA), // 아이템 아이콘 색상
        selectedItemColor: Colors.black, // 선택된 아이템 텍스트 색상
        type: BottomNavigationBarType.fixed, // 애니메이션 없애기
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'test',
          ),
        ],
      ),
    );
  }
}
