import 'package:flutter/material.dart';
import 'package:kofoos/ui/common/appbar_widget.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text(
          '카메라뷰',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
