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
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 52),
          child: OutlinedButton(
            onPressed: isEnabled ? onPressed : null,
            style: OutlinedButton.styleFrom(
              shape: shape,
              side: const BorderSide(color: IthakiTheme.lightGraphite),
              foregroundColor: IthakiTheme.textPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: Text(
              label,
              style: IthakiTheme.buttonLabel,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );
    }

    final bgColor =
        isEnabled ? IthakiTheme.primaryPurple : IthakiTheme.primaryPurpleLight;

    return SizedBox(
      width: double.infinity,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 52),
        child: ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            disabledBackgroundColor: IthakiTheme.primaryPurpleLight,
            foregroundColor: IthakiTheme.foregroundWhite,
            disabledForegroundColor: IthakiTheme.foregroundWhite,
            shape: shape,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: Text(
            label,
            style: IthakiTheme.buttonLabel,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
