import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _bottomNaviItemIndex = 0;

  final List<IconData> _bottomNaviBarIcon = [
    Icons.manage_search_rounded,
    Icons.label_outline_rounded,
    Icons.other_houses_outlined,
    Icons.thumb_up_alt_rounded,
    Icons.my_library_books_outlined,
  ];

  final List<String> _bottomNaviBarString = [
    '메뉴&검색',
    '브랜드',
    '홈',
    '좋아요',
    '마이P',
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _bottomNaviBarIcon.map((i) {
        _bottomNaviItemIndex = _bottomNaviItemIndex % 5;
        return BottomNavigationBarItem(
          icon: Icon(_bottomNaviBarIcon[_bottomNaviItemIndex]),
          label: _bottomNaviBarString[_bottomNaviItemIndex++],
        );
      }).toList(),
      elevation: 0,
      selectedFontSize: 12.0,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      showUnselectedLabels: true,
      currentIndex: 2,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
    );
  }
}
