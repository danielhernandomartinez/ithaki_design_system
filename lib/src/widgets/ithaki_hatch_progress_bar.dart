import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';

/// A progress bar with a hatched gray background and a filled lime segment.
class IthakiHatchProgressBar extends StatelessWidget {
  final double progress; // 0.0 – 1.0
  final Color fillColor;

  const IthakiHatchProgressBar({
    super.key,
    required this.progress,
    this.fillColor = IthakiTheme.badgeLime,
  });

  @override
  Widget build(BuildContext context) {
    final pct = (progress * 100).round();
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(
        height: 20,
        child: Stack(
          children: [
            CustomPaint(
              size: const Size(double.infinity, 20),
              painter: _HatchPainter(),
            ),
            FractionallySizedBox(
              widthFactor: progress,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  '$pct%',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: IthakiTheme.textPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HatchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = const Color(0xFFE0E0E0),
    );
    final paint = Paint()
      ..color = const Color(0xFFCCCCCC)
      ..strokeWidth = 1.5;
    const spacing = 8.0;
    for (double x = -size.height; x < size.width + size.height; x += spacing) {
      canvas.drawLine(Offset(x, size.height), Offset(x + size.height, 0), paint);
    }
  }

  @override
  bool shouldRepaint(_HatchPainter old) => false;
}
