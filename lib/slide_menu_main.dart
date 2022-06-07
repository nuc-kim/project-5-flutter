import 'package:flutter/material.dart';

class SlideMenuMain extends StatefulWidget{
  const SlideMenuMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SlideMenuMainState();
}

class _SlideMenuMainState extends State<SlideMenuMain>{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          TextButton(
            onPressed: () {
              debugPrint('추천');
            },
            child: const Text(
              '추천',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('랭킹');
            },
            child: const Text(
              '랭킹',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('커뮤니티');
            },
            child: const Text(
              '커뮤니티',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('래플');
            },
            child: const Text(
              '래플',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('이벤트');
            },
            child: const Text(
              '이벤트',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('테스트6');
            },
            child: const Text(
              '테스트6',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('테스트7');
            },
            child: const Text(
              '테스트7',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('테스트8');
            },
            child: const Text(
              '테스트8',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('테스트9');
            },
            child: const Text(
              '테스트9',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('테스트10');
            },
            child: const Text(
              '테스트10',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}