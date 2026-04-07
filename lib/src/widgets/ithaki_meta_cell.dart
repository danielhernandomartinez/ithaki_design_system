import 'package:flutter/material.dart';

import '../theme/ithaki_theme.dart';

class IthakiMetaCell extends StatelessWidget {
  final IconData icon;
  final String value;
  final bool alignIconTop;
  final bool flexible;
  final double fontSize;

  const IthakiMetaCell(
    this.icon,
    this.value, {
    super.key,
    this.alignIconTop = false,
    this.flexible = false,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(icon, size: 14, color: IthakiTheme.softGraphite);
    final textWidget = Text(
      value,
      style: IthakiTheme.bodySmall.copyWith(
        fontSize: fontSize,
        color: IthakiTheme.textSecondary,
      ),
      overflow: flexible ? TextOverflow.ellipsis : null,
    );

    return Row(
      crossAxisAlignment:
          alignIconTop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        alignIconTop
            ? Padding(
                padding: const EdgeInsets.only(top: 1),
                child: iconWidget,
              )
            : iconWidget,
        const SizedBox(width: 4),
        flexible ? Flexible(child: textWidget) : Expanded(child: textWidget),
      ],
    );
  }
}
