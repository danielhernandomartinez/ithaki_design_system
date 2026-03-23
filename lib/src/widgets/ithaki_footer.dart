import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';

/// A reusable footer with brand name, social icons, copyright, and legal links.
class IthakiFooter extends StatelessWidget {
  final String brandName;
  final String copyright;
  final List<Widget> socialIcons;
  final String? privacyLabel;
  final String? termsLabel;
  final VoidCallback? onPrivacyTap;
  final VoidCallback? onTermsTap;

  const IthakiFooter({
    super.key,
    required this.brandName,
    required this.copyright,
    this.socialIcons = const [],
    this.privacyLabel,
    this.termsLabel,
    this.onPrivacyTap,
    this.onTermsTap,
  });

  Widget _underlinedText(String text, {double fontSize = 12, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 3),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: IthakiTheme.softGraphite, width: 1),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontSize > 12 ? FontWeight.w600 : FontWeight.w400,
            color: IthakiTheme.softGraphite,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _underlinedText(brandName, fontSize: 16),
          if (socialIcons.isNotEmpty) ...[
            const SizedBox(height: 16),
            Row(
              children: socialIcons
                  .map((icon) => Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: icon,
                      ))
                  .toList(),
            ),
          ],
          const SizedBox(height: 16),
          Text(
            copyright,
            style: const TextStyle(
              fontSize: 12,
              color: IthakiTheme.softGraphite,
            ),
          ),
          if (privacyLabel != null || termsLabel != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                if (privacyLabel != null)
                  _underlinedText(privacyLabel!, onTap: onPrivacyTap),
                if (privacyLabel != null && termsLabel != null)
                  const SizedBox(width: 24),
                if (termsLabel != null)
                  _underlinedText(termsLabel!, onTap: onTermsTap),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
