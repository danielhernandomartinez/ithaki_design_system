import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_flag.dart';
import 'search_bottom_sheet.dart';
import '../models/search_item.dart';

class _DigitsOnlyFormatter extends TextInputFormatter {
  final int maxLength;
  _DigitsOnlyFormatter(this.maxLength);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue old, TextEditingValue next) {
    final digits = next.text.replaceAll(RegExp(r'[^\d]'), '');
    final clamped = digits.length > maxLength ? digits.substring(0, maxLength) : digits;
    return TextEditingValue(
      text: clamped,
      selection: TextSelection.collapsed(offset: clamped.length),
    );
  }
}

class PhoneCountry {
  final String code;    // ISO 3166-1 alpha-2 lowercase (for flag)
  final String name;
  final String dialCode;
  final int minDigits;
  final int maxDigits;

  const PhoneCountry({
    required this.code,
    required this.name,
    required this.dialCode,
    required this.minDigits,
    required this.maxDigits,
  });
}

const _countries = <PhoneCountry>[
  PhoneCountry(code: 'es', name: 'Spain',          dialCode: '+34',  minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'us', name: 'United States',  dialCode: '+1',   minDigits: 10, maxDigits: 10),
  PhoneCountry(code: 'gb', name: 'United Kingdom', dialCode: '+44',  minDigits: 10, maxDigits: 10),
  PhoneCountry(code: 'gr', name: 'Greece',         dialCode: '+30',  minDigits: 10, maxDigits: 10),
  PhoneCountry(code: 'de', name: 'Germany',        dialCode: '+49',  minDigits: 10, maxDigits: 11),
  PhoneCountry(code: 'fr', name: 'France',         dialCode: '+33',  minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'it', name: 'Italy',          dialCode: '+39',  minDigits: 9,  maxDigits: 10),
  PhoneCountry(code: 'pt', name: 'Portugal',       dialCode: '+351', minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'nl', name: 'Netherlands',    dialCode: '+31',  minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'be', name: 'Belgium',        dialCode: '+32',  minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'ch', name: 'Switzerland',    dialCode: '+41',  minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'at', name: 'Austria',        dialCode: '+43',  minDigits: 10, maxDigits: 11),
  PhoneCountry(code: 'pl', name: 'Poland',         dialCode: '+48',  minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'se', name: 'Sweden',         dialCode: '+46',  minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'no', name: 'Norway',         dialCode: '+47',  minDigits: 8,  maxDigits: 8),
  PhoneCountry(code: 'dk', name: 'Denmark',        dialCode: '+45',  minDigits: 8,  maxDigits: 8),
  PhoneCountry(code: 'fi', name: 'Finland',        dialCode: '+358', minDigits: 9,  maxDigits: 10),
  PhoneCountry(code: 'ro', name: 'Romania',        dialCode: '+40',  minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'hu', name: 'Hungary',        dialCode: '+36',  minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'cz', name: 'Czech Republic', dialCode: '+420', minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'tr', name: 'Turkey',         dialCode: '+90',  minDigits: 10, maxDigits: 10),
  PhoneCountry(code: 'ru', name: 'Russia',         dialCode: '+7',   minDigits: 10, maxDigits: 10),
  PhoneCountry(code: 'ua', name: 'Ukraine',        dialCode: '+380', minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'ae', name: 'UAE',            dialCode: '+971', minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'sa', name: 'Saudi Arabia',   dialCode: '+966', minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'in', name: 'India',          dialCode: '+91',  minDigits: 10, maxDigits: 10),
  PhoneCountry(code: 'cn', name: 'China',          dialCode: '+86',  minDigits: 11, maxDigits: 11),
  PhoneCountry(code: 'jp', name: 'Japan',          dialCode: '+81',  minDigits: 10, maxDigits: 10),
  PhoneCountry(code: 'br', name: 'Brazil',         dialCode: '+55',  minDigits: 10, maxDigits: 11),
  PhoneCountry(code: 'mx', name: 'Mexico',         dialCode: '+52',  minDigits: 10, maxDigits: 10),
  PhoneCountry(code: 'ar', name: 'Argentina',      dialCode: '+54',  minDigits: 10, maxDigits: 10),
  PhoneCountry(code: 'ca', name: 'Canada',         dialCode: '+1',   minDigits: 10, maxDigits: 10),
  PhoneCountry(code: 'au', name: 'Australia',      dialCode: '+61',  minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'za', name: 'South Africa',   dialCode: '+27',  minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'ng', name: 'Nigeria',        dialCode: '+234', minDigits: 10, maxDigits: 10),
  PhoneCountry(code: 'eg', name: 'Egypt',          dialCode: '+20',  minDigits: 10, maxDigits: 10),
  PhoneCountry(code: 'ma', name: 'Morocco',        dialCode: '+212', minDigits: 9,  maxDigits: 9),
  PhoneCountry(code: 'sg', name: 'Singapore',      dialCode: '+65',  minDigits: 8,  maxDigits: 8),
  PhoneCountry(code: 'kr', name: 'South Korea',    dialCode: '+82',  minDigits: 9,  maxDigits: 10),
];

class IthakiPhoneField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String label;
  final PhoneCountry? initialCountry;

  const IthakiPhoneField({
    super.key,
    required this.controller,
    this.onChanged,
    this.label = 'Phone Number',
    this.initialCountry,
  });

  @override
  State<IthakiPhoneField> createState() => _IthakiPhoneFieldState();
}

class _IthakiPhoneFieldState extends State<IthakiPhoneField> {
  late PhoneCountry _country;
  bool _showError = false;
  bool _touched = false;

  @override
  void initState() {
    super.initState();
    _country = widget.initialCountry ?? _countries.first;
    widget.controller.addListener(_validate);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_validate);
    super.dispose();
  }

  void _validate() {
    if (!_touched) return;
    final digits = widget.controller.text.replaceAll(RegExp(r'[^\d]'), '');
    setState(() {
      _showError = digits.isNotEmpty &&
          (digits.length < _country.minDigits || digits.length > _country.maxDigits);
    });
  }

  void _openCountryPicker() {
    final items = _countries.map((c) => SearchItem(
      id: c.code,
      label: c.name,
      subtitle: c.dialCode,
    )).toList();

    SearchBottomSheet.show(
      context,
      'Select Country',
      items,
      (item) {
        final selected = _countries.firstWhere((c) => c.code == item.id);
        setState(() {
          _country = selected;
          widget.controller.clear();
          _showError = false;
          _touched = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: IthakiTheme.labelField,
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _showError ? IthakiTheme.errorRed : IthakiTheme.borderLight,
              width: _showError ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              // Country selector
              GestureDetector(
                onTap: _openCountryPicker,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: IthakiTheme.borderLight),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 16,
                        child: IthakiFlag(_country.code),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _country.dialCode,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: IthakiTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.keyboard_arrow_down, size: 16, color: IthakiTheme.textSecondary),
                    ],
                  ),
                ),
              ),
              // Phone input
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [_DigitsOnlyFormatter(_country.maxDigits)],
                  style: const TextStyle(fontSize: 14, color: IthakiTheme.textPrimary),
                  onChanged: (val) {
                    if (!_touched && val.isNotEmpty) setState(() => _touched = true);
                    _validate();
                    widget.onChanged?.call('${_country.dialCode}$val');
                  },
                  decoration: InputDecoration(
                    hintText: '${_country.minDigits}–${_country.maxDigits} digits',
                    hintStyle: const TextStyle(color: IthakiTheme.textHint, fontSize: 14),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_showError) ...[
          const SizedBox(height: 6),
          const Text(
            'Please enter correct phone number',
            style: TextStyle(fontSize: 12, color: IthakiTheme.errorRed),
          ),
        ],
      ],
    );
  }
}
