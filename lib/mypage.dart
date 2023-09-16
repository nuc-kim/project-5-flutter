import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = '마이페이지';

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyPageScreen(),
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      ),
    );
  }
}

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyPageScreen();
}

class _MyPageScreen extends State<MyPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => debugPrint('내정보관리'),
              icon: Icon(Icons.menu_rounded),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () => debugPrint('장바구니'),
              icon: Icon(Icons.shopping_bag_outlined),
              color: Colors.black,
            ),
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://googleflutter.com/sample_image.jpg'),
                        fit: BoxFit.fill)),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Text(
                '내닉네임',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () => debugPrint('닉네임수정'),
                icon: Icon(
                  Icons.mode_edit,
                  color: Colors.black,
                  size: 15,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
              OutlinedButton(
                onPressed: () => debugPrint('등급'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.grade_rounded,
                      color: Colors.black,
                      size: 12,
                    ),
                    Text(
                      '관리자',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
            ],
          ),
        ],
      ),
    );
  }
}
