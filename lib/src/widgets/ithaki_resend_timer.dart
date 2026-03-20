import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

enum IthakiResendTimerVariant { card, text }

class IthakiResendTimer extends StatelessWidget {
  final bool canResend;
  final int secondsLeft;
  final String label;
  final VoidCallback onResend;
  final IthakiResendTimerVariant variant;
  final String? icon;

  const IthakiResendTimer({
    super.key,
    required this.canResend,
    required this.secondsLeft,
    required this.label,
    required this.onResend,
    this.variant = IthakiResendTimerVariant.text,
    this.icon,
  });

  String get _timerLabel {
    if (canResend) return label;
    return '$label in 0:${secondsLeft.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    if (variant == IthakiResendTimerVariant.card) {
      return GestureDetector(
        onTap: canResend ? onResend : null,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: IthakiTheme.cardBackground,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: IthakiTheme.borderLight),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (icon != null) ...[
                IthakiIcon(icon!, size: 22, color: IthakiTheme.textPrimary),
                const SizedBox(height: 8),
              ],
              Text(
                _timerLabel,
                style: IthakiTheme.bodySmallMedium.copyWith(
                  color: canResend ? IthakiTheme.primaryPurple : IthakiTheme.textSecondary,
                  decoration: canResend ? TextDecoration.underline : null,
                  decorationColor: IthakiTheme.primaryPurple,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: canResend ? onResend : null,
      child: RichText(
        text: TextSpan(
          style: IthakiTheme.bodySmall.copyWith(color: IthakiTheme.textSecondary),
          children: canResend
              ? [
                  TextSpan(
                    text: label,
                    style: IthakiTheme.bodySmallSemiBold.copyWith(
                      color: IthakiTheme.primaryPurple,
                      decoration: TextDecoration.underline,
                      decorationColor: IthakiTheme.primaryPurple,
                    ),
                  ),
                ]
              : [
                  TextSpan(text: '$label in '),
                  TextSpan(
                    text: '0:${secondsLeft.toString().padLeft(2, '0')}',
                    style: IthakiTheme.bodySmallBold,
                  ),
                ],
        ),
      ),
    );
  }
}
