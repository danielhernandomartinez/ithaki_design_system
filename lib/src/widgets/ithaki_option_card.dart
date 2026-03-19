import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

enum IthakiOptionCardType { sms, whatsapp }

class IthakiOptionCard extends StatelessWidget {
  final IthakiOptionCardType type;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;

  const IthakiOptionCard({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
  });

  String get _icon => type == IthakiOptionCardType.whatsapp ? 'whatsapp' : 'envelope';
  double get _iconSize => type == IthakiOptionCardType.whatsapp ? 16.67 : 20;
  String get _label => type == IthakiOptionCardType.whatsapp
      ? 'Send secured code via WhatsApp'
      : 'Send secured code via SMS';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IthakiIcon(_icon, size: _iconSize, color: _resolvedIconColor),
            const SizedBox(height: 8),
            Text(
              _label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: _textColor),
            ),
          ],
        ),
      ),
    );
  }
}
