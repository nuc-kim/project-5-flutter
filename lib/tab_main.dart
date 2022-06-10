import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/utils.dart';
import 'package:flutter/material.dart';

class TabMain extends StatefulWidget {
  const TabMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabMainState();
}

class _TabMainState extends State<TabMain> {
  int _current = 0;
  final List<String> _items = [
    'resources/images/img_notice_parts_intro-campaign-21-0928-01.png',
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
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              items: _items.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(i),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),

              /*[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset('resources/images/img_notice_parts_intro-campaign-21-0928-01.png'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset('resources/images/idol_full001.png'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset('resources/images/idol_full002.png'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset('resources/images/idol_full022.png'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset('resources/images/idol_full036.png'),
                ),
                CarouselIndicator(
                  count: ,
                )
              ],*/
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
            /*CarouselIndicator(
              count: _items.length,
              index: _current,
              color: Colors.black,
            ),*/
          ],
        ),
      ],
    );
  }
}
