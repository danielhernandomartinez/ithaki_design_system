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
    this.horizontalPadding = 16,
    this.verticalPadding = 20,
  });

  @override
  Widget build(BuildContext context) {
    final appBarHeight = appBar?.preferredSize.height ?? 0;
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: SafeArea(
        top: false,
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: horizontalPadding,
            right: horizontalPadding,
            top: appBar != null ? appBarHeight + topPadding + verticalPadding : verticalPadding,
            bottom: verticalPadding,
          ),
          child: child,
        ),
      ),
    );
  }
}
