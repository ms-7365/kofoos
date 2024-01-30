import 'package:flutter/material.dart';
import 'package:kofoos/ui/common/appbar_widget.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text(
          '위시리스트뷰',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
