import 'package:flutter/material.dart';
import 'package:project_5_flutter/common/util/build_context_extensions.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    super.key,
    this.title,
    this.isPopUp = false,
    this.onBackPressed,
    this.backgroundColor,
    required this.body,
  });

  final String? title;
  final bool isPopUp;
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: isPopUp
            ? IconButton(
                onPressed: onBackPressed ??
                    () {
                      Navigator.of(context).pop();
                    },
                padding: const EdgeInsets.only(left: 5),
                splashRadius: 20,
                color: context.colorScheme.onSurface,
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              )
            : null,
        title: title != null
            ? Text(
                title!,
                style: const TextStyle(
                  color: Colors.black,
                ),
              )
            : null,
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: SafeArea(
        child: body,
      ),
    );
  }
}
