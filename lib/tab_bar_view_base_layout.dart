import 'package:flutter/material.dart';
import 'package:project_5_flutter/tab_bar_view_goods_list.dart';
import 'package:project_5_flutter/tab_bar_view_main.dart';

class TabBarViewBaseLayout extends StatefulWidget {
  const TabBarViewBaseLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabBarViewBaseLayoutState();
}

class _TabBarViewBaseLayoutState extends State<TabBarViewBaseLayout> {

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        // 메인 탭 컨텐츠
        const TabBarViewMain(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '랭킹',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        const Text(
          '커뮤니티',
          style: TextStyle(color: Colors.black),
        ),
        const TabBarViewGoodsList(),
        const Text(
          '이벤트',
          style: TextStyle(color: Colors.black),
        ),
        const Text(
          '테스트6',
          style: TextStyle(color: Colors.black),
        ),
        const Text(
          '테스트7',
          style: TextStyle(color: Colors.black),
        ),
        const Text(
          '테스트8',
          style: TextStyle(color: Colors.black),
        ),
        const Text(
          '테스트9',
          style: TextStyle(color: Colors.black),
        ),
        const Text(
          '테스트10',
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}