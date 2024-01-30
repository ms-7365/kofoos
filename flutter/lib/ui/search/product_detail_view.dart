import 'package:flutter/material.dart';
import 'package:kofoos/ui/common/appbar_widget.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          '프로덕트 디테일',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );
  }
}
