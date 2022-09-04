import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_5_flutter/mypage.dart';
import 'package:project_5_flutter/sign_in.dart';
import 'package:project_5_flutter/tab_bar_delegate.dart';
import 'package:project_5_flutter/tab_bar_view_base_layout.dart';
import 'package:project_5_flutter/title_bar.dart';

import 'blocs/bloc_imports.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarouselBloc(),
      child: Container(
        child: BlocBuilder<CarouselBloc, CarouselState>(
          builder: (context, state) {
            return Text('Slide Index: ${state.carouoselValue}');
          },
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _showFloatingActionButton = false;
  late ScrollController _floatingActionButtonScrollController =
      ScrollController();
  int _bottomNaviItemIndex = 0;
  int _screenBodyIndex = 2;

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
  void initState() {
    _floatingActionButtonScrollController.addListener(() {
      setState(() {
        if (_floatingActionButtonScrollController.position.pixels >= 10) {
          _showFloatingActionButton = true;
        } else {
          _showFloatingActionButton = false;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _floatingActionButtonScrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _floatingActionButtonScrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  List<Widget> _screenBodyList = [];

  _MainScreenState() {
    _screenBodyList = [
      SignIn(),
      SignIn(),
      MainScreenBody(
          fabScrollController: _floatingActionButtonScrollController),
      SignIn(),
      MyPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenBodyList.elementAt(_screenBodyIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _screenBodyIndex = index;
          });
        },
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
        currentIndex: _screenBodyIndex,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
      ),
      // 플로팅 버튼 - 아래로 스크롤하면 등장하는 구조
      floatingActionButton: _showFloatingActionButton
          ? FloatingActionButton(
              onPressed: () {
                return _scrollToTop();
              }, //_scrollToTop,
              child: const Icon(Icons.arrow_upward_rounded),
            )
          : null,
    );
  }
}

class MainScreenBody extends StatefulWidget {
  const MainScreenBody({Key? key, required this.fabScrollController})
      : super(key: key);

  final ScrollController fabScrollController;

  @override
  State<StatefulWidget> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<MainScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 10,
        child: NestedScrollView(
          controller: widget.fabScrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // 최상단 타이틀바
              SliverAppBar(
                pinned: false,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                toolbarHeight: 48,
                elevation: 0,
                backgroundColor: Colors.white,
                title: const TitleBar(),
              ),
              // 최상단 탭바
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverPersistentHeader(
                  pinned: true,
                  delegate: TabBarDelegate(),
                ),
              ),
            ];
          },
          body: Column(
            children: const [
              Expanded(
                // 탭바에 대응하는 탭바뷰 레이아웃
                child: TabBarViewBaseLayout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
