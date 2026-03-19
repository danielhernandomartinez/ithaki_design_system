import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';

class IthakiBackLink extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const IthakiBackLink({super.key, required this.onTap, this.label = 'Back'});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: IthakiTheme.textPrimary,
          decoration: TextDecoration.underline,
          decorationColor: IthakiTheme.textPrimary,
        ),
      ),
    );
  }
}
