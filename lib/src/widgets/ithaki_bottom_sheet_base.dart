// lib/src/widgets/ithaki_bottom_sheet_base.dart
import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

/// White modal bottom sheet scaffold with title and × close button.
/// Usage:
///   showModalBottomSheet(
///     context: context,
///     isScrollControlled: true,
///     backgroundColor: IthakiTheme.transparent,
///     builder: (_) => BottomSheetBase(title: 'X', child: ...),
///   );
class BottomSheetBase extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback? onClose;

  const BottomSheetBase({
    super.key,
    required this.title,
    required this.child,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final keyboardHeight = mq.viewInsets.bottom;
    // maxHeight shrinks when the keyboard is visible so the sheet never
    // overflows the top of the screen.
    final maxHeight = mq.size.height * 0.92 - keyboardHeight;

    return Padding(
      padding: EdgeInsets.only(bottom: keyboardHeight),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: Container(
          decoration: const BoxDecoration(
            color: IthakiTheme.backgroundWhite,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: IthakiTheme.textPrimary,
                    ),
                  ),
                  IconButton(
                    icon: const IthakiIcon('x-close',
                        size: 22, color: IthakiTheme.textPrimary),
                    onPressed: onClose ?? () => Navigator.of(context).pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Flexible(child: child),
              // SafeArea uses MediaQuery.padding.bottom which Flutter calculates
              // automatically: gesture-bar height when keyboard is hidden, 0 when
              // the keyboard is covering it. No conditionals, no animation needed.
              const SafeArea(
                  top: false,
                  left: false,
                  right: false,
                  child: SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
