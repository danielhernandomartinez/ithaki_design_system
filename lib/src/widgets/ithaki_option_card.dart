import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

class IthakiOptionCard extends StatelessWidget {
  final String? icon;
  final String label;
  final String? subtitle;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final double iconSize;
  final Axis axis;
  final bool showLeadingCheckbox;
  final bool enabled;

  const IthakiOptionCard({
    super.key,
    this.icon,
    required this.label,
    this.subtitle,
    required this.isSelected,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.iconSize = 20,
    this.axis = Axis.horizontal,
    this.showLeadingCheckbox = false,
    this.enabled = true,
  });

  Widget _checkbox(bool selected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: selected ? IthakiTheme.primaryPurple : Colors.transparent,
        border: Border.all(
          color: selected ? IthakiTheme.primaryPurple : IthakiTheme.softGraphite,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: selected
          ? const Icon(Icons.check, size: 13, color: Colors.white)
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final resolvedIconColor = iconColor ?? (isSelected ? IthakiTheme.primaryPurple : IthakiTheme.textPrimary);
    final textColor = isSelected && enabled
        ? IthakiTheme.primaryPurple
        : enabled
            ? IthakiTheme.textPrimary
            : IthakiTheme.textSecondary;

    Widget card = AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: axis == Axis.horizontal ? 14 : 14),
      decoration: BoxDecoration(
        color: isSelected && enabled
            ? IthakiTheme.backgroundViolet
            : IthakiTheme.softGray,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected && enabled
              ? IthakiTheme.primaryPurple
              : IthakiTheme.lightGray,
          width: 1,
        ),
      ),
      child: axis == Axis.vertical
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (icon != null) IthakiIcon(icon!, size: iconSize, color: resolvedIconColor),
                if (icon != null) const SizedBox(height: 8),
                Text(label, style: IthakiTheme.bodySmallBold.copyWith(color: textColor)),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(subtitle!, style: IthakiTheme.captionDescription),
                ],
              ],
            )
          : Row(
              children: [
                if (showLeadingCheckbox) ...[
                  _checkbox(isSelected && enabled),
                  const SizedBox(width: 12),
                ] else if (icon != null) ...[
                  IthakiIcon(icon!, size: iconSize, color: resolvedIconColor),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label, style: IthakiTheme.bodySmallSemiBold.copyWith(color: textColor)),
                      if (subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          subtitle!,
                          style: IthakiTheme.captionDescription.copyWith(
                            color: enabled
                                ? IthakiTheme.textSecondary
                                : IthakiTheme.textSecondary.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
    );

    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Opacity(
        opacity: enabled ? 1.0 : 0.5,
        child: card,
      ),
    );
  }
}
