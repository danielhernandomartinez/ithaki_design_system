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
  final double iconSize;

  const IthakiOptionCard({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedIconColor = iconColor ?? (isSelected ? IthakiTheme.primaryPurple : IthakiTheme.textPrimary);
    final textColor = isSelected ? IthakiTheme.primaryPurple : IthakiTheme.textPrimary;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF0EAFA) : backgroundColor ?? const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? IthakiTheme.primaryPurple : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            IthakiIcon(icon, size: iconSize, color: resolvedIconColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textColor),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, size: 20, color: IthakiTheme.primaryPurple),
          ],
        ),
      ),
    );
  }
}
