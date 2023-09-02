import 'package:flutter/material.dart';
import 'package:project_5_flutter/common/view/default_layout.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '메뉴&검색',
      body: Center(
        child: Text('메뉴&검색'),
      ),
    );
  }
}
