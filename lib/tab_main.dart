import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TabMain extends StatefulWidget {
  const TabMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabMainState();
}

class _TabMainState extends State<TabMain> {
  int _carouselIndex = 0;
  int _gridViewIndex = 0;
  int _bestPostIndex = 0;

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

  final List<String> _bestPostNo = [
    '60494',
    '60491',
    '60477',
    '60486',
    '60493',
  ];

  final List<String> _bestPostWriter = [
    '샤이나리',
    '이챕터스',
    '피해제한탱커좀',
    '크게라디오를켜고',
    '고양이네크로맨서',
  ];

  final List<String> _bestPostHit = [
    '10867',
    '9113',
    '9830',
    '5150',
    '6898',
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
    '블루 아카이브',
    '붕괴3rd',
    '로스트아크',
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
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListBody(
        mainAxis: Axis.vertical,
        children: [
          Stack(
            alignment: const Alignment(0, 0.85),
            children: [
              CarouselSlider(
                items: _carouselitemStrings.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: IconButton(
                                onPressed: () =>
                                    debugPrint('clicked image $_carouselIndex'),
                                icon: Image.asset(i),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
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
                    }),
              ),
              CarouselIndicator(
                count: _carouselitemStrings.length,
                index: _carouselIndex,
                color: Colors.black45,
                activeColor: Colors.white70,
              ),
            ],
          ),
          GridView.count(
            crossAxisCount: 5,
            shrinkWrap: true,
            children: _gridItemStrings.map((i) {
              if (_gridViewIndex >= _gridItemIcons.length) {
                _gridViewIndex = 0;
              }
              return Builder(builder: (BuildContext context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => debugPrint('clicked icon $i'),
                      icon: Icon(_gridItemIcons[_gridViewIndex++]),
                    ),
                    Text(
                      i,
                    ),
                  ],
                );
              });
            }).toList(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 12, 12),
            child: Text(
              '베스트 5',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: _bestPostNo.map((i) {
              if (_bestPostIndex >= _bestPostNo.length) {
                _bestPostIndex = 0;
              }
              return Builder(builder: (BuildContext context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Text(
                        _bestPostCommunityName[_bestPostIndex],
                      ),
                      title: Text(
                        _bestPostTitleStrings[_bestPostIndex],
                      ),
                      subtitle: Text(
                        _bestPostComment[_bestPostIndex],
                      ),
                      trailing: Text(
                        _bestPostLike[_bestPostIndex++],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ],
                );
              });
            }).toList(),
          ),
        ],
      ),
    );
  }
}
