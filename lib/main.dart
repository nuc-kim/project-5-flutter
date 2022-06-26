import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_5_flutter/custom_bottom_navigation_bar.dart';
import 'package:project_5_flutter/tab_bar_delegate.dart';
import 'package:project_5_flutter/tab_bar_view_base_layout.dart';
import 'package:project_5_flutter/title_bar.dart';

void main() {
  runApp(const MyApp());
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
  late ScrollController _floatingActionButtonScrollController;

  @override
  void initState() {
    _floatingActionButtonScrollController = ScrollController()..addListener(() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 10,
          child: NestedScrollView(
            controller: _floatingActionButtonScrollController,
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
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
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
