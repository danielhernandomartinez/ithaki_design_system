import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IthakiFlag extends StatelessWidget {
  final String countryCode;
  final double width;
  final double height;
  final bool oval;

  const IthakiFlag(
    this.countryCode, {
    super.key,
    this.width = 20,
    this.height = 15,
    this.oval = false,
  });

  @override
  Widget build(BuildContext context) {
    final code = countryCode.toLowerCase();
    final svg = SvgPicture.asset(
      'packages/ithaki_design_system/assets/flags/$code.svg',
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholderBuilder: (_) => SizedBox(width: width, height: height),
    );
    if (oval) return ClipOval(child: svg);
    return ClipRRect(
      child: svg,
    );
  }
}
