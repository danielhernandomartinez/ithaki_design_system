import 'package:flutter/material.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';
import 'ithaki_text_field.dart';

class IthakiPasswordField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;

  const IthakiPasswordField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.focusNode,
    this.onChanged,
  });

  @override
  State<IthakiPasswordField> createState() => _IthakiPasswordFieldState();
}

class _IthakiPasswordFieldState extends State<IthakiPasswordField> {
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final hasText = widget.controller.text.isNotEmpty;
    return IthakiTextField(
      label: widget.label,
      hint: widget.hint,
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: _obscure,
      suffixIcon: IconButton(
        icon: IthakiIcon(
          _obscure ? 'eye' : 'eye-closed',
          size: 20,
          color: hasText ? IthakiTheme.textPrimary : IthakiTheme.softGraphite,
        ),
        onPressed: () => setState(() => _obscure = !_obscure),
      ),
      onChanged: widget.onChanged,
    );
  }
}
