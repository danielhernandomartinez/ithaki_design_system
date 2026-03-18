import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

class IthakiOptionCard extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;

  const IthakiOptionCard({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFF0EAFA)
              : backgroundColor ?? const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(14),
          border: isSelected
              ? Border.all(color: IthakiTheme.primaryPurple, width: 1.5)
              : null,
        ),
        child: Row(
          children: [
            IthakiIcon(
              icon,
              size: 22,
              color: iconColor ?? IthakiTheme.textPrimary,
            ),
            const SizedBox(width: 14),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: isSelected ? IthakiTheme.primaryPurple : IthakiTheme.textPrimary,
              ),
            ),
            const Spacer(),
            if (isSelected)
              const Icon(Icons.check_circle, size: 20, color: IthakiTheme.primaryPurple),
          ],
        ),
      ),
    );
  }
}
