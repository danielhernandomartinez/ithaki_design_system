import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

class _PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue old, TextEditingValue next) {
    final digits = next.text.replaceAll(RegExp(r'[^\d]'), '');
    final buf = StringBuffer();
    if (digits.isNotEmpty) buf.write('+');
    for (int i = 0; i < digits.length && i < 14; i++) {
      if (i == 3) buf.write(' ');
      buf.write(digits[i]);
    }
    final result = buf.toString();
    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }
}

class IthakiPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String label;
  final String hint;

  const IthakiPhoneField({
    super.key,
    required this.controller,
    this.onChanged,
    this.label = 'Phone Number',
    this.hint = '+XXX XXXXXXXX XXX',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: IthakiTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          keyboardType: TextInputType.phone,
          inputFormatters: [_PhoneFormatter()],
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter phone number';
            }

            final digits = value.replaceAll(RegExp(r'[^\d]'), '');
            
            if (digits.length < 9 || digits.length > 14) {
              return 'Please enter correct phone number';
            }

            return null;
          },
          style: const TextStyle(fontSize: 14, color: IthakiTheme.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: IthakiTheme.textHint, fontSize: 14),
            suffixIcon: const Padding(
              padding: EdgeInsets.all(12),
              child: IthakiIcon('phone', size: 18, color: IthakiTheme.textHint),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: IthakiTheme.borderLight),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: IthakiTheme.borderLight),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: IthakiTheme.primaryPurple, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
