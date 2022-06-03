import 'package:flutter/material.dart';

class SlideMenu extends StatefulWidget{
  const SlideMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu>{
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
              debugPrint('테스트1');
            },
            child: const Text(
              '테스트1',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('테스트2');
            },
            child: const Text(
              '테스트2',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('테스트3');
            },
            child: const Text(
              '테스트3',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('테스트4');
            },
            child: const Text(
              '테스트4',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('테스트5');
            },
            child: const Text(
              '테스트5',
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