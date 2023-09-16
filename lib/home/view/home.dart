import 'package:flutter/material.dart';
import 'package:project_5_flutter/tab_bar_delegate.dart';
import 'package:project_5_flutter/tab_bar_view_base_layout.dart';
import 'package:project_5_flutter/title_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static const String path = 'home';

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 10,
        child: NestedScrollView(
          // controller: widget.fabScrollController,
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
