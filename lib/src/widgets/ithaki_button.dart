import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';

enum IthakiButtonVariant { primary, outline }

class IthakiButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IthakiButtonVariant variant;
  final bool isEnabled;
  final Color? outlineColor;

  const IthakiButton(
    this.label, {
    super.key,
    this.onPressed,
    this.variant = IthakiButtonVariant.primary,
    this.isEnabled = true,
    this.outlineColor,
  });

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    );

    if (variant == IthakiButtonVariant.outline) {
      return SizedBox(
        width: double.infinity,
        height: 52,
        child: OutlinedButton(
          onPressed: isEnabled ? onPressed : null,
          style: OutlinedButton.styleFrom(
            shape: shape,
            side: const BorderSide(color: Color(0xFFA5A5A5)),
            foregroundColor: IthakiTheme.textPrimary,
          ),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ),
      );
    }

    final bgColor = isEnabled ? IthakiTheme.primaryPurple : IthakiTheme.primaryPurpleLight;

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          disabledBackgroundColor: IthakiTheme.primaryPurpleLight,
          foregroundColor: Colors.white,
          disabledForegroundColor: Colors.white,
          shape: shape,
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
    );
  }
}
