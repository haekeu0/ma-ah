import 'package:flutter/material.dart';
import 'my_map_page.dart';
import 'my_profile_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        // Builder 위젯을 사용하여 적절한 context 제공
        builder: (context) => Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // 나는 천재야
            // 나도
            // 나는 앙냥이야
            // 내가 메인이야
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'MA-AH',
                style: TextStyle(
                    color: Color(0xff73665C),
                    fontSize: 50,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                '길냥이 찾기',
                style: TextStyle(
                    color: Color(0xff73665C),
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffF7B327)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyMapPage()));
                },
                child: Text(
                  'G 구글 로그인',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              TextButton(
                child: Text(
                  '방문이 처음이신가요? 가입하기',
                  style: TextStyle(
                      color: Color(0xffF7B327),
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {},
              ),
              Image.asset('assets/Kittens Strike Back.png'),
              Text(
                '길냥이 랭킹 1위',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              Text(
                '-냥근혜곤듀-',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
      ),
    );
  }
}
