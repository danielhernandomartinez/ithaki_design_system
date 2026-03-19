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
        final isDisabled =
            !isSelected && maxSelect != null && selected.length >= maxSelect!;
        return GestureDetector(
          onTap: isDisabled ? null : () => _toggle(option),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? IthakiTheme.backgroundViolet : IthakiTheme.softGray,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected
                    ? IthakiTheme.primaryPurple
                    : isDisabled
                        ? IthakiTheme.lightGraphite.withValues(alpha: 0.4)
                        : IthakiTheme.lightGraphite,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 18,
                  child: AnimatedOpacity(
                    opacity: isSelected ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.check, size: 13, color: IthakiTheme.primaryPurple),
                  ),
                ),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: isSelected ? 0.0 : 9.0, end: isSelected ? 9.0 : 0.0),
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  builder: (_, offset, child) => Transform.translate(
                    offset: Offset(offset, 0),
                    child: child,
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isDisabled ? IthakiTheme.textHint : IthakiTheme.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(width: 18),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
