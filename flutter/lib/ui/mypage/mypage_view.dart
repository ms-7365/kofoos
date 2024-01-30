import 'package:flutter/material.dart';
import 'package:kofoos/ui/mypage/users_delete_api.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECECEC),
      appBar: AppBar(
        backgroundColor: Color(0xff343F56),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xff343F56),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 32,
                    ),
                    Text(
                      ' My page',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        // 유저 삭제 api
                        usersDeleteAPI(context);
                      },
                      child: Text(
                        'Delete Account',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.grey,
                          decorationThickness: 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 20.0,
              color: Colors.white,
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Text(
                    '   Language',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // 언어 설정 api
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffECECEC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                      child: Text(
                        // 유저 설정 언어 정보
                        'Eng(US)',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20.0,
              color: Colors.white,
            ),
            Divider(
              color: Color(0xffECECEC),
              height: 2.0,
              thickness: 2.0,
            ),
            Container(
              height: 20.0,
              color: Colors.white,
            ),
            Row(
              children: [
                Text(
                  '   Disliked Foods',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              color: Color(0xffECECEC),
              height: 2.0,
              thickness: 2.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text(
                  '   History',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Color(0xffECECEC), // 배경색 지정
                    child: Text(
                      '   KOFOOS',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffCACACA)),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
