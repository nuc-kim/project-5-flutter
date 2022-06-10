import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TabMain extends StatefulWidget {
  const TabMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabMainState();
}

class _TabMainState extends State<TabMain> {
  int _current = 0;
  final List<String> _items = [
    'resources/images/idol_full000.png',
    'resources/images/idol_full001.png',
    'resources/images/idol_full002.png',
    'resources/images/idol_full022.png',
    'resources/images/idol_full036.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: const Alignment(0, 0.85),
          children: [
            CarouselSlider(
              items: _items.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: IconButton(
                              onPressed: () => debugPrint('clicked image $_current'),
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
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            CarouselIndicator(
              count: _items.length,
              index: _current,
              color: Colors.black45,
              activeColor: Colors.white70,
            ),
          ],
        ),
      ],
    );
  }
}
