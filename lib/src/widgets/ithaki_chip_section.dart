import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_chip_group.dart';

class IthakiChipSection extends StatelessWidget {
  final String title;
  final String description;
  final List<String> options;
  final Set<String> selected;
  final ValueChanged<Set<String>> onChanged;
  final int? maxSelect;

  const IthakiChipSection({
    super.key,
    required this.title,
    required this.description,
    required this.options,
    required this.selected,
    required this.onChanged,
    this.maxSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: IthakiTheme.textPrimary)),
        const SizedBox(height: 4),
        Text(description, style: IthakiTheme.bodyRegular),
        const SizedBox(height: 10),
        IthakiChipGroup(
          options: options,
          selected: selected,
          onChanged: onChanged,
          maxSelect: maxSelect,
        ),
      ],
    );
  }
}
