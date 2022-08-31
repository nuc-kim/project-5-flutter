import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_5_flutter/hide_navi_bar.dart';
import 'package:project_5_flutter/main.dart';

class TabBarViewMain extends StatefulWidget {
  const TabBarViewMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabBarViewMainState();
}

class _TabBarViewMainState extends State<TabBarViewMain> {
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
    '커스텀',
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
    return Column(
      children: [
        // CustomScrollView offset 위치 조정을 위한 SizedBox
        // 없으면 상단 Carousel 짤림
        const SizedBox(
          height: 46,
        ),
        // CustomScrollView를 위한 Expanded
        Expanded(
          child: CustomScrollView(
            slivers: [
              // CustomScrollView children은 sliver class들로 구현해야함
              // 일반적인 Column 등으로 구현할 경우 Exception 발생
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
                                },
                              );
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
                              'clicked icon ${_gridItemStrings[--index]}'),
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
              ),
              // Padding
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                ),
              ),
              // Breadcrumbs
              // 중간에 고정되는 서브 타이틀
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
                      width: 60,
                      alignment: Alignment.center,
                      child: Text(_bestPostCommunityName[index]),
                    ),
                    title: Text(_bestPostTitleStrings[index]),
                    subtitle: Text('[${_bestPostComment[index]}]'),
                    trailing: Container(
                      width: 60,
                      alignment: Alignment.center,
                      child: Text(_bestPostLike[index++]),
                    ),
                  );
                }, childCount: 10),
              ),
            ],
          ),
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
            children: const [
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
