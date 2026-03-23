import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';

/// A horizontal progress bar showing a match percentage with a label.
///
/// Used in job recommendation cards to display match strength.
class IthakiMatchBar extends StatelessWidget {
  final int percentage;
  final String label;
  final List<Color> gradientColors;
  final Color backgroundColor;

  const IthakiMatchBar({
    super.key,
    required this.percentage,
    required this.label,
    this.gradientColors = const [Color(0xFF50C948), IthakiTheme.matchGreen],
    this.backgroundColor = IthakiTheme.matchBarBg,
  });

  @override
  Widget build(BuildContext context) {
    final mainColor = gradientColors.first;

    return Container(
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: percentage / 100,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: gradientColors),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$percentage%',
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: IthakiTheme.textPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      label,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: IthakiTheme.textPrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
