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
  final Axis axis;

  const IthakiOptionCard({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.iconSize = 20,
    this.axis = Axis.horizontal,
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
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: axis == Axis.horizontal ? 20 : 14),
        decoration: BoxDecoration(
          color: isSelected ? IthakiTheme.backgroundViolet : IthakiTheme.softGray,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? IthakiTheme.primaryPurple : IthakiTheme.lightGray,
            width: 1,
          ),
        ),
        child: axis == Axis.vertical
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IthakiIcon(icon, size: iconSize, color: resolvedIconColor),
                  const SizedBox(height: 8),
                  Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: textColor)),
                ],
              )
            : Row(
                children: [
                  IthakiIcon(icon, size: iconSize, color: resolvedIconColor),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textColor)),
                  ),
                ],
              ),
      ),
    );
  }
}
