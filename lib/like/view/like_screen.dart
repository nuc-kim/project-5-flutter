import 'package:flutter/material.dart';
import 'package:project_5_flutter/common/view/default_layout.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '좋아요',
      body: Center(
        child: Text('좋아요'),
      ),
    );
  }
}
