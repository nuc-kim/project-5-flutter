import 'package:flutter/material.dart';
import 'package:project_5_flutter/brand/view/brand_screen.dart';
import 'package:project_5_flutter/home/view/home.dart';
import 'package:project_5_flutter/like/view/like_screen.dart';
import 'package:project_5_flutter/mypage.dart';
import 'package:project_5_flutter/search/view/search_screen.dart';

enum BottomNavigation {
  search(
    label: '메뉴&검색',
    icon: Icons.manage_search_rounded,
  ),
  brand(
    label: '브랜드',
    icon: Icons.label_outline_rounded,
  ),
  home(
    label: '홈',
    icon: Icons.other_houses_outlined,
  ),
  like(
    label: '좋아요',
    icon: Icons.thumb_up_alt_rounded,
  ),
  my(
    label: '마이',
    icon: Icons.my_library_books_outlined,
  );

  final String label;
  final IconData icon;

  const BottomNavigation({
    required this.label,
    required this.icon,
  });
}

extension BottomNavigationExtension on BottomNavigation {
  Widget get renderScreen {
    switch(this) {
      case BottomNavigation.search:
        return const SearchScreen();
      case BottomNavigation.brand:
        return const BrandScreen();
      case BottomNavigation.home:
        return const HomeScreen();
      case BottomNavigation.like:
        return const LikeScreen();
      case BottomNavigation.my:
        return const MyScreen();
    }
  }
}
