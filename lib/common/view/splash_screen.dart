import 'package:flutter/material.dart';
import 'package:project_5_flutter/common/const/data.dart';
import 'package:project_5_flutter/common/view/default_layout.dart';
import 'package:project_5_flutter/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    deleteToken();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => MainScreen()),
        ),
      );
    });
  }

  void deleteToken() async {
    await storage.deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PROJECT FIVE',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 24),
            CircularProgressIndicator(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
