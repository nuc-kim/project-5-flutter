import 'package:flutter/material.dart';
import 'package:project_5_flutter/common/view/default_layout.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '브랜드',
      body: Center(
        child: Text('브랜드'),
      ),
    );
  }
}
