import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

enum IthakiOptionCardLayout { row, column }

class IthakiOptionCard extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final IthakiOptionCardLayout layout;

  const IthakiOptionCard({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.layout = IthakiOptionCardLayout.row,
  });

  Color get _resolvedIconColor =>
      iconColor ?? (isSelected ? IthakiTheme.primaryPurple : IthakiTheme.textPrimary);

  Color get _textColor =>
      isSelected ? IthakiTheme.primaryPurple : IthakiTheme.textPrimary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFF0EAFA)
              : backgroundColor ?? const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(14),
          border: isSelected
              ? Border.all(color: IthakiTheme.primaryPurple, width: 1.5)
              : Border.all(color: Colors.transparent, width: 1.5),
        ),
        child: layout == IthakiOptionCardLayout.column
            ? _buildColumn()
            : _buildRow(),
      ),
    );
  }

  Widget _buildRow() {
    return Row(
      children: [
        IthakiIcon(icon, size: 22, color: _resolvedIconColor),
        const SizedBox(width: 14),
        Text(
          label,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: _textColor),
        ),
        const Spacer(),
        if (isSelected)
          const Icon(Icons.check_circle, size: 20, color: IthakiTheme.primaryPurple),
      ],
    );
  }

  Widget _buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IthakiIcon(icon, size: 28, color: _resolvedIconColor),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: _textColor),
        ),
      ],
    );
  }
}
