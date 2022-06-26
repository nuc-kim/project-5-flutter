
import 'package:flutter/material.dart';
import 'package:project_5_flutter/goods.dart';
import 'package:project_5_flutter/utils.dart';

class TabBarViewGoodsList extends StatefulWidget{
  const TabBarViewGoodsList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabBarViewGoodsListState();
}

class _TabBarViewGoodsListState extends State<TabBarViewGoodsList>{

  static const goodsList = [
    Goods(
        'resources/images/goods/goods_index_001.jpg',
        '상품 제목 1',
        30000,
        '상품 설명 1'
    ),
    Goods(
        'resources/images/goods/goods_index_002.jpeg',
        '상품 제목 2',
        40000,
        '상품 설명 2'
    ),
    Goods(
        'resources/images/goods/goods_index_003.jpg',
        '상품 제목 3',
        120000,
        '상품 설명 3'
    ),
  ];

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const SizedBox(
          height: 46,
        ),
      Expanded(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index){
                  index = index % 3;
                  return CustomListGoods(
                      goodsImage: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0)
                        ),
                        child: Image.asset(
                          goodsList[index].imageUrl,
                        ),
                      ),
                      title: goodsList[index].title,
                      price: goodsList[index].price,
                      subTitle: goodsList[index].description,
                  );
                }, childCount: goodsList.length * 30),
              ),
            ],
          ),
      )],
    );
  }
}

class _GoodsDescription extends StatelessWidget{
  const _GoodsDescription ({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.price,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final int price;

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                Text(
                  subTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.black54,
                  ),
                )
              ],
            )
        ),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  Utils.getPriceNumberFormat(price),
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.black87,
                  ),
                )
              ],
            )
        )
      ],
    );
  }
}

class CustomListGoods extends StatelessWidget{
  const CustomListGoods({Key? key,
  required this.goodsImage,
  required this.title,
  required this.price,
  required this.subTitle
  }) : super(key: key);

  final Widget goodsImage;
  final String title;
  final String subTitle;
  final int price;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: goodsImage,
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 2.0, 5.0),
                  child: _GoodsDescription(
                    title: title,
                    subTitle: subTitle,
                    price: price,
                  ),
                ),
            )
          ],
        ),
      ) ,
    );
  }
}