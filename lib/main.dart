import 'package:flutter/material.dart';
import 'package:project_5_flutter/sign_in.dart';
import 'package:project_5_flutter/slide_menu_main.dart';
import 'package:project_5_flutter/tab_main.dart';

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
    return MaterialApp(
      title: titleText,
      theme: ThemeData(
        primarySwatch: primaryWhite,
      ),
      home: DefaultTabController(
        length: 10,
        child: Scaffold(
          appBar: AppBar(
            title: const TitleBar(),
            elevation: 0,
            bottom: const TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.black45,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  text: '추천',
                ),
                Tab(
                  text: '랭킹',
                ),
                Tab(
                  text: '커뮤니티',
                ),
                Tab(
                  text: '래플',
                ),
                Tab(
                  text: '이벤트',
                ),
                Tab(
                  text: '테스트6',
                ),
                Tab(
                  text: '테스트7',
                ),
                Tab(
                  text: '테스트8',
                ),
                Tab(
                  text: '테스트9',
                ),
                Tab(
                  text: '테스트10',
                ),
              ],
            ),
          ),
          body: const BodyStructure(),
          backgroundColor: Colors.white,
        ),
      ),
    );
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
  @override
  Widget build(BuildContext context) {
    return const TabBarView(children: <Widget>[
      TabMain(),
      Text(
        '랭킹',
        style: TextStyle(color: Colors.black),
      ),
      Text(
        '커뮤니티',
        style: TextStyle(color: Colors.black),
      ),
      Text(
        '래플',
        style: TextStyle(color: Colors.black),
      ),
      Text(
        '이벤트',
        style: TextStyle(color: Colors.black),
      ),
      Text(
        '테스트6',
        style: TextStyle(color: Colors.black),
      ),
      Text(
        '테스트7',
        style: TextStyle(color: Colors.black),
      ),
      Text(
        '테스트8',
        style: TextStyle(color: Colors.black),
      ),
      Text(
        '테스트9',
        style: TextStyle(color: Colors.black),
      ),
      Text(
        '테스트10',
        style: TextStyle(color: Colors.black),
      ),
    ]);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
