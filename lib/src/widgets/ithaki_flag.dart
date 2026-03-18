import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IthakiFlag extends StatelessWidget {
  final String countryCode;
  final double width;
  final double height;

  const IthakiFlag(
    this.countryCode, {
    super.key,
    this.width = 28,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    final code = countryCode.toLowerCase();
    return SvgPicture.asset(
      'packages/ithaki_design_system/assets/flags/$code.svg',
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholderBuilder: (_) => SizedBox(width: width, height: height),
    );
  }
}
