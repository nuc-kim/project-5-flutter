import 'package:bo_study/view/page/intro.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: IntroPage()
      );
  }
}

// return MaterialApp(
//  title: 'StartUp Name Generator',
//   theme: ThemeData(
//     appBarTheme: const AppBarTheme(
//       backgroundColor: Colors.blue,
//       foregroundColor: Colors.black,
//     ),
//   ),
//   home: RandomWords(),
// );



