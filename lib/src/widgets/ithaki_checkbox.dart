import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';

class IthakiCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget child;

  const IthakiCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 18,
            height: 18,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: value ? IthakiTheme.primaryPurple : Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: value ? IthakiTheme.primaryPurple : IthakiTheme.borderLight,
                width: 1.5,
              ),
            ),
            child: value
                ? const Icon(Icons.check, size: 12, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 10),
          Expanded(child: child),
        ],
      ),
    );
  }
}
