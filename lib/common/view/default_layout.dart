import 'package:flutter/material.dart';
import 'package:project_5_flutter/common/const/project_five_color.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    super.key,
    required this.title,
    required this.isPopUp,
    required this.body,
  });

  final String title;
  final bool isPopUp;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: isPopUp
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                padding: const EdgeInsets.only(left: 5),
                splashRadius: 20,
                color: Colors.black,
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              )
            : null,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ProjectFiveColor.background,
      ),
      body: body,
    );
  }
}
