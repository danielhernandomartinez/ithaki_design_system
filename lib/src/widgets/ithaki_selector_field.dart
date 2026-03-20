import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';

class IthakiSelectorField extends StatelessWidget {
  final String label;
  final String hint;
  final String? value;
  final VoidCallback onTap;
  final bool optional;
  final bool enabled;

  const IthakiSelectorField({
    super.key,
    required this.label,
    required this.hint,
    required this.onTap,
    this.value,
    this.optional = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final selected = value != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: IthakiTheme.fieldLabel,
            ),
            if (optional)
              const Text(
                ' (optional)',
                style: IthakiTheme.captionRegular,
              ),
          ],
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: enabled ? onTap : null,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selected ? IthakiTheme.primaryPurple : IthakiTheme.borderLight,
                width: selected ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value ?? hint,
                    style: selected ? IthakiTheme.labelField : IthakiTheme.hintStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: enabled ? IthakiTheme.textSecondary : IthakiTheme.softGraphite,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
