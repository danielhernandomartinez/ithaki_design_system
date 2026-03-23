import 'package:flutter/material.dart';

/// A gradient CTA banner with title, subtitle, and action button.
///
/// Used for career assistant, premium features, and promotional cards.
class IthakiGradientBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonLabel;
  final Widget? buttonIcon;
  final VoidCallback? onButtonPressed;
  final Color buttonColor;
  final DecorationImage? backgroundImage;
  final List<Color> gradientColors;

  const IthakiGradientBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    this.buttonIcon,
    this.onButtonPressed,
    this.buttonColor = const Color(0x33FFFFFF),
    this.backgroundImage,
    this.gradientColors = const [
      Color(0xFF2D0A6E),
      Color(0xFF5B2DB5),
      Color(0xFF7B52D3),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: backgroundImage,
        gradient: backgroundImage == null
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gradientColors,
              )
            : null,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: onButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: const BorderSide(color: Colors.white, width: 1),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (buttonIcon != null) ...[
                    buttonIcon!,
                    const SizedBox(width: 8),
                  ],
                  Text(
                    buttonLabel,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
