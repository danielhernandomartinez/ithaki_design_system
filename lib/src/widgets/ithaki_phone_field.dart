import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_icon.dart';

class _PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue old, TextEditingValue next) {
    String cleanText = next.text.replaceAll(RegExp(r'[^\d\s]'), '');
    cleanText = cleanText.replaceAll(RegExp(r'\s+'), ' ');
    final buf = StringBuffer();
    if (cleanText.isNotEmpty) buf.write('+');
    for (int i = 0; i < cleanText.length && buf.length < 16; i++) {
      buf.write(cleanText[i]);
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
    this.hint = '+XXX XXXXXXXX',
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

            final regex = RegExp(r'^\+\d{1,3} \d{8,11}$');
            
            if (!regex.hasMatch(value.trim())) {
              return 'Please enter a valid format (e.g., +XX XXXXXXXX)';
            }

            return null;
          },
          style: const TextStyle(fontSize: 16, color: IthakiTheme.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: IthakiTheme.textHint, fontSize: 16),
            suffixIcon: const Padding(
              padding: EdgeInsets.all(12),
              child: IthakiIcon('phone', size: 18, color: IthakiTheme.textHint),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: IthakiTheme.borderLight),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: IthakiTheme.borderLight),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: IthakiTheme.primaryPurple, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: IthakiTheme.errorRed),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: IthakiTheme.errorRed, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}