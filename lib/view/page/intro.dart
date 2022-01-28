import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget{
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('intro'),
      ),
      body: const SafeArea(
        child: Center(
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                '지금 세계에서 무슨 일이 일어나고 있는지 알아보세요.',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26
                ),
              ),
            ),
        ),
      ),
    );
  }
}