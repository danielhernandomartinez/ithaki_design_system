import 'package:flutter/material.dart';

import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

class IthakiSocialAuthButton extends StatelessWidget {
  final String label;
  final String iconName;
  final VoidCallback? onPressed;
  final double iconSize;

  const IthakiSocialAuthButton({
    super.key,
    required this.label,
    required this.iconName,
    this.onPressed,
    this.iconSize = 22,
  });

  const IthakiSocialAuthButton.google({
    super.key,
    required this.label,
    this.onPressed,
    this.iconSize = 22,
  }) : iconName = 'google-social';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: const BorderSide(color: IthakiTheme.borderLight),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IthakiIcon(iconName, size: iconSize),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: IthakiTheme.bodyRegular.copyWith(
                  color: IthakiTheme.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
