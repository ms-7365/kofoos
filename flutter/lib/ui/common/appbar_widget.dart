import 'package:flutter/material.dart';
import 'package:kofoos/ui/common/main_view.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 120.0,
      leading: Builder(
        builder: (BuildContext context) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => MainView(),
                  transitionDuration: Duration(seconds: 0), // 페이지 이동 애니메이션 삭제
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 15.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo/header_logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
