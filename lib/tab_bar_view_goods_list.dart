
import 'package:flutter/material.dart';
import 'package:project_5_flutter/goods.dart';

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
        '상품 설명 1'
    ),
    Goods(
        'resources/images/goods/goods_index_002.jpeg',
        '상품 제목 2',
        '상품 설명 2'
    ),
    Goods(
        'resources/images/goods/goods_index_003.jpg',
        '상품 제목 3',
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
                  return ListTile(
                    leading: Container(
                      width: 150,
                      alignment: Alignment.center,
                      child: Image.asset(
                        goodsList[index].imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text(goodsList[index].title),
                    subtitle: Text(goodsList[index].description),
                    onTap: ()=>debugPrint('clicked ${goodsList[index].title}'),
                    dense: false,

                  );
                }, childCount: goodsList.length * 30),
              ),
            ],
          ),
      )],
    );
  }
}