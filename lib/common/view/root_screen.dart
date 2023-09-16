import 'package:flutter/material.dart';
import 'package:project_5_flutter/common/const/data.dart';
import 'package:project_5_flutter/common/enum/bottom_navigation.dart';
import 'package:project_5_flutter/sign_in.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  static const path = 'root';

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final _fABScrollController = ScrollController();
  bool _isFABVisible = false;
  int _screenIndex = 2;
  BottomNavigation currentScreen = BottomNavigation.home;

  @override
  void initState() {
    _fABScrollController.addListener(() {
      setState(() {
        _showFAB();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _fABScrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _fABScrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _showFAB() {
    if (_fABScrollController.position.pixels >= 10) {
      _isFABVisible = true;
    } else {
      _isFABVisible = false;
    }
  }

  void _checkToken() async {
    final refreshToken = await storage.read(key: refreshTokenKey);
    final accessToken = await storage.read(key: accessTokenKey);

    if (refreshToken == null || accessToken == null) {
      final isBackPressed = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const SignIn(),
        ),
      );
      if (isBackPressed) {
        setState(() {
          currentScreen = BottomNavigation.home;
          _screenIndex = 2;
        });
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentScreen.renderScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index != 2) {
            _checkToken();
          }
          setState(() {
            _screenIndex = index;
          });
        },
        items: BottomNavigation.values.map((element) {
          return BottomNavigationBarItem(
            label: element.label,
            icon: Icon(element.icon),
          );
        }).toList(),
        elevation: 0,
        selectedFontSize: 12.0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        showUnselectedLabels: true,
        currentIndex: _screenIndex,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: _isFABVisible
          ? FloatingActionButton(
              onPressed: () {
                return _scrollToTop();
              }, //_scrollToTop,
              child: const Icon(Icons.arrow_upward_rounded),
            )
          : null,
    );
  }
}
