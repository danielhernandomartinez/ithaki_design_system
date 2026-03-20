import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
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
          color: Colors.black,
        ),
        onPressed: () => setState(() => _obscure = !_obscure),
      ),
      onChanged: widget.onChanged,
    );
  }
}
