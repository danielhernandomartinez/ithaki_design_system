import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

class IthakiAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showLogin;
  final bool showBack;
  final bool showMenuAndAvatar;
  final VoidCallback? onBack;
  final VoidCallback? onLoginPressed;

  const IthakiAppBar({
    super.key,
    this.showLogin = true,
    this.showBack = false,
    this.showMenuAndAvatar = false,
    this.onBack,
    this.onLoginPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(top: topPadding + 8, left: 16, right: 16, bottom: 8),
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            color: IthakiTheme.backgroundWhite,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLeading() ?? const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Ithaki',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              ..._buildActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget? _buildLeading() {
    if (showMenuAndAvatar) {
      return IconButton(
        icon: const IthakiIcon('menu', size: 22),
        onPressed: () {},
      );
    }
    if (showBack) {
      return TextButton(
        onPressed: onBack,
        child: const Text(
          'Back',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: IthakiTheme.textPrimary,
            fontSize: 14,
          ),
        ),
      );
    }
    return null;
  }

  List<Widget> _buildActions() {
    if (showMenuAndAvatar) {
      return [
        IconButton(
          icon: const IthakiIcon('notifications-bell', size: 22),
          onPressed: () {},
        ),
        const Padding(
          padding: EdgeInsets.only(right: 8),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: IthakiTheme.successGreen,
            child: Text(
              'AA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ];
    }
    if (showLogin) {
      return [
        TextButton(
          onPressed: onLoginPressed,
          child: Container(
            padding: const EdgeInsets.only(bottom: 3),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: IthakiTheme.textPrimary, width: 1.2),
              ),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                color: IthakiTheme.textPrimary,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ];
    }
    return [];
  }
}
