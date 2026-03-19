import 'package:flutter/material.dart';

class IthakiScreenLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget child;
  final double horizontalPadding;
  final double verticalPadding;

  const IthakiScreenLayout({
    super.key,
    this.appBar,
    required this.child,
    this.horizontalPadding = 24,
    this.verticalPadding = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        top: false,
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: child,
        ),
      ),
    );
  }
}
