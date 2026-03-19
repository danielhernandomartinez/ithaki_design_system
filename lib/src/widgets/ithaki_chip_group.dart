import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';

class IthakiChipGroup extends StatelessWidget {
  final List<String> options;
  final Set<String> selected;
  final ValueChanged<Set<String>> onChanged;
  final int? maxSelect;

  const IthakiChipGroup({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
    this.maxSelect,
  });

  void _toggle(String option) {
    final next = Set<String>.from(selected);
    if (next.contains(option)) {
      next.remove(option);
    } else if (maxSelect == null || next.length < maxSelect!) {
      next.add(option);
    }
    onChanged(next);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((option) {
        final isSelected = selected.contains(option);
        final isDisabled = !isSelected && maxSelect != null && selected.length >= maxSelect!;
        return GestureDetector(
          onTap: isDisabled ? null : () => _toggle(option),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFF0EAFA) : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected
                    ? IthakiTheme.primaryPurple
                    : isDisabled
                        ? IthakiTheme.borderLight.withValues(alpha: 0.5)
                        : IthakiTheme.borderLight,
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Opacity(
                  opacity: isSelected ? 1.0 : 0.0,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: Icon(Icons.check, size: 14, color: IthakiTheme.primaryPurple),
                  ),
                ),
                Text(
                  option,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected
                        ? IthakiTheme.primaryPurple
                        : isDisabled
                            ? IthakiTheme.textHint
                            : IthakiTheme.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
