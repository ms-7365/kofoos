import 'package:flutter/material.dart';
import 'package:kofoos/ui/common/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'KOFOOS',
        theme: ThemeData(
          primaryColor: Colors.black,
          buttonTheme: ButtonThemeData(

          ),
          scaffoldBackgroundColor: Color(0xffECECEC),
          dialogTheme: DialogTheme(
            // backgroundColor: Colors.redAccent,
            // titleTextStyle: TextStyle(color: Colors.white), // 제목 텍스트 색상
            // contentTextStyle: TextStyle(color: Colors.white), // 내용 텍스트 색상
          )
        ),
        home: MainView(),
    );
  }
}