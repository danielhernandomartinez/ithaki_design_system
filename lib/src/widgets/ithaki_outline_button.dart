import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';

class IthakiOutlineButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? foregroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  /// When true the button shrinks to fit its content instead of expanding full-width.
  final bool autoWidth;

  const IthakiOutlineButton(
    this.label, {
    super.key,
    this.icon,
    this.onPressed,
    this.borderColor,
    this.foregroundColor,
    this.borderRadius = 30,
    this.padding,
    this.autoWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = OutlinedButton.styleFrom(
      side: BorderSide(color: borderColor ?? IthakiTheme.softGraphite),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      foregroundColor: foregroundColor ?? IthakiTheme.textPrimary,
      tapTargetSize: autoWidth ? MaterialTapTargetSize.shrinkWrap : null,
    );

    final btn = icon != null
        ? OutlinedButton.icon(
            onPressed: onPressed,
            icon: icon!,
            label: Text(label),
            style: style,
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: style,
            child: Text(label),
          );

    return autoWidth ? btn : SizedBox(width: double.infinity, child: btn);
  }
}
