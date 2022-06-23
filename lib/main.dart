import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

void main() {
  //runApp(const MyApp());
  //runApp(const SignIn());
  runApp(const MyApp());
}

// 20220606 HSH 테마 색상 변경 - appbar 기본 색상 변경 용
const MaterialColor primaryWhite = MaterialColor(
  _whitePrimaryValue,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(_whitePrimaryValue),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

const int _whitePrimaryValue = 0xFFFFFFFF;
const titleText = '프로젝트 5';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      ),
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if(_scrollController.position.pixels >= 10){
            _showBackToTopButton = true;
          }else{
            _showBackToTopButton = false;
          }
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 10,
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: false,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  toolbarHeight: 48,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  title: TitleBar(),
                ),
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
              children: [
                Expanded(
                  child: BodyStructure(),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _showBackToTopButton
          ? FloatingActionButton(
              onPressed: () {
                return _scrollToTop();
              }, //_scrollToTop,
              child: Icon(Icons.arrow_upward_rounded),
            )
          : null,
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  TabBarDelegate();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: TabBar(
        isScrollable: true,
        tabs: [
          Tab(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 1),
              color: Colors.white,
              child: Text('메인'),
            ),
          ),
          Tab(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: Text('랭킹'),
            ),
          ),
          Tab(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: Text('커뮤니티'),
            ),
          ),
          Tab(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: Text('래플'),
            ),
          ),
          Tab(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: Text('이벤트'),
            ),
          ),
          Tab(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: Text('테스트6'),
            ),
          ),
          Tab(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: Text('테스트7'),
            ),
          ),
          Tab(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: Text('테스트8'),
            ),
          ),
          Tab(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: Text('테스트9'),
            ),
          ),
          Tab(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: Text('테스트10'),
            ),
          ),
        ],
        indicatorWeight: 2.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

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

class BodyStructure extends StatefulWidget {
  const BodyStructure({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyStructureState();
}

class _BodyStructureState extends State<BodyStructure> {
  int _carouselIndex = 0;

  final List<String> _carouselitemStrings = [
    'resources/images/idol_full000.png',
    'resources/images/idol_full001.png',
    'resources/images/idol_full002.png',
    'resources/images/idol_full022.png',
    'resources/images/idol_full036.png',
  ];

  final List<String> _gridItemStrings = [
    '피규어',
    '건프라',
    '아니메',
    '게임',
    '신상',
    '아울렛',
    '세일',
    '이벤트',
    '매거진',
    '커스텀'
  ];

  final List<String> _bestPostTitleStrings = [
    '일본에서 산 원신 웨하스 왔다',
    '최저임금 동결하는 manhwa',
    '조별과제 결말',
    '지휘군단장님 인스타 글 올리셨다',
    '협곡 순애',
  ];

  final List<String> _bestPostLike = [
    '304',
    '235',
    '338',
    '154',
    '240',
  ];

  final List<String> _bestPostComment = [
    '108',
    '68',
    '159',
    '54',
    '46',
  ];

  final List<String> _bestPostCommunityName = [
    '원신',
    '블루아카',
    '붕괴',
    '로아',
    '롤',
  ];

  final List<IconData> _gridItemIcons = [
    Icons.emoji_people_rounded,
    Icons.android_rounded,
    Icons.animation_rounded,
    Icons.gamepad_rounded,
    Icons.new_label_rounded,
    Icons.outlet_rounded,
    Icons.point_of_sale_rounded,
    Icons.event,
    Icons.book,
    Icons.dashboard_customize_rounded
  ];

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        Column(
          children: [
            const SizedBox(
              height: 46,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // Carousel slider
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Stack(
                          alignment: const Alignment(0, 0.85),
                          children: [
                            CarouselSlider(
                              items: _carouselitemStrings.map(
                                (i) {
                                  return Builder(
                                      builder: (BuildContext context) {
                                    return SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: IconButton(
                                        onPressed: () => debugPrint(
                                            'clicked image $_carouselIndex'),
                                        icon: Image.asset(i),
                                        padding: EdgeInsets.zero,
                                      ),
                                    );
                                  });
                                },
                              ).toList(),
                              options: CarouselOptions(
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _carouselIndex = index;
                                  });
                                },
                              ),
                            ),
                            CarouselIndicator(
                              count: _carouselitemStrings.length,
                              index: _carouselIndex,
                              color: Colors.black45,
                              activeColor: Colors.white70,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Padding
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                  ),
                  // Grid Menu
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        index = index % 10;

                        return Column(
                          children: [
                            IconButton(
                              onPressed: () => debugPrint(
                                  'clicked icon ${_gridItemStrings[index]}'),
                              icon: Icon(_gridItemIcons[index]),
                            ),
                            Text(
                              _gridItemStrings[index++],
                            ),
                          ],
                        );
                      },
                      childCount: 10,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                  ),
                  // Padding
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                    ),
                  ),
                  // Breadcrumbs
                  const SliverPersistentHeader(
                    pinned: true,
                    delegate: BestPostBreadcrumbs(),
                  ),
                  // Best posts
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      index = index % 5;

                      return ListTile(
                        leading: Container(
                          child: Text(_bestPostCommunityName[index]),
                          width: 60,
                          alignment: Alignment.center,
                        ),
                        title: Text(_bestPostTitleStrings[index]),
                        subtitle: Text('[${_bestPostComment[index]}]'),
                        trailing: Container(
                          child: Text(_bestPostLike[index++]),
                          width: 60,
                          alignment: Alignment.center,
                        ),
                      );
                    }, childCount: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
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
        const Text(
          '래플',
          style: TextStyle(color: Colors.black),
        ),
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

class BestPostBreadcrumbs extends SliverPersistentHeaderDelegate {
  const BestPostBreadcrumbs();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
          onPressed: () => debugPrint('clicked best posts'),
          child: Column(
            children: [
              Text(
                '베스트 5',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0,
                    color: Colors.black),
              ),
              Text(
                '지금 핫한 5 포스트!',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    color: Colors.black45),
              ),
            ],
          )),
    );
  }

  @override
  double get maxExtent => 72;

  @override
  double get minExtent => 68;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
