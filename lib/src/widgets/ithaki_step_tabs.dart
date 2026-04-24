import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

class IthakiStepTabs extends StatelessWidget {
  final List<String> steps;
  final int currentIndex;
  final int completedUpTo;

  const IthakiStepTabs({
    super.key,
    required this.steps,
    required this.currentIndex,
    required this.completedUpTo,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: steps.asMap().entries.map((entry) {
          final index = entry.key;
          final label = entry.value;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: _buildChip(index, label),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildChip(int index, String label) {
    final isActive = index == currentIndex;
    final isCompleted = index <= completedUpTo;

    Color borderColor;
    Color textColor;
    Color bgColor;

    if (isActive) {
      borderColor = IthakiTheme.primaryPurple;
      textColor = IthakiTheme.primaryPurple;
      bgColor = IthakiTheme.chipActive;
    } else if (isCompleted) {
      borderColor = IthakiTheme.primaryPurple;
      textColor = IthakiTheme.primaryPurple;
      bgColor = IthakiTheme.backgroundViolet;
    } else {
      borderColor = IthakiTheme.borderLight;
      textColor = IthakiTheme.textSecondary;
      bgColor = IthakiTheme.backgroundWhite;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isCompleted) ...[
            IthakiIcon('check', size: 14, color: textColor),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: IthakiTheme.fieldLabel.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
