import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';

/// A small icon + text label pair, used for metadata tags
/// (location, work mode, duration, level, etc.).
class IthakiInfoTag extends StatelessWidget {
  final Widget icon;
  final String label;
  final Color color;
  final double fontSize;

  const IthakiInfoTag({
    super.key,
    required this.icon,
    required this.label,
    this.color = IthakiTheme.textSecondary,
    this.fontSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: fontSize, color: color),
        ),
      ],
    );
  }
}
