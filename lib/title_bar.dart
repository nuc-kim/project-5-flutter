import 'package:flutter/material.dart';

const titleText = '프로젝트 5';

class TitleBar extends StatefulWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              debugPrint('알람');
            },
            icon: const Icon(
              Icons.announcement_outlined,
              color: Colors.black,
            ),
          ),
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            titleText,
            style: TextStyle(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Align(
          alignment: const Alignment(0.65, 0.0),
          child: IconButton(
            onPressed: () {
              debugPrint('검색');
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {
              debugPrint('장바구니');
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}