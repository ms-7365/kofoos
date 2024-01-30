import 'package:flutter/material.dart';
import 'package:kofoos/ui/common/appbar_widget.dart';
import 'package:kofoos/ui/search/product_detail_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Row(
        children: [
          Text(
            '서치뷰',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          TextButton(
            child: Text('test'),
            onPressed: () {
              // 페이지 이동 테스트
              // ProductDetailView();
            },
          )
        ],
      ),
    );
  }
}
