import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

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
              color: value
                  ? IthakiTheme.primaryPurple
                  : IthakiTheme.backgroundWhite,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color:
                    value ? IthakiTheme.primaryPurple : IthakiTheme.borderLight,
                width: 1.5,
              ),
            ),
            child: value
                ? const IthakiIcon('check',
                    size: 12, color: IthakiTheme.foregroundWhite)
                : null,
          ),
          const SizedBox(width: 10),
          Expanded(child: child),
        ],
      ),
    );
  }
}
