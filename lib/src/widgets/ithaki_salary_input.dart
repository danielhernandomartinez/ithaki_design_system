import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/ithaki_theme.dart';
import '../models/search_item.dart';
import 'ithaki_checkbox.dart';
import 'search_bottom_sheet.dart';

class IthakiSalaryInput extends StatelessWidget {
  final TextEditingController amountController;
  final String? paymentTerm;
  final List<SearchItem> paymentTermOptions;
  final ValueChanged<String> onPaymentTermChanged;
  final bool preferNotToSpecify;
  final ValueChanged<bool> onPreferNotToSpecifyChanged;

  const IthakiSalaryInput({
    super.key,
    required this.amountController,
    required this.paymentTerm,
    required this.paymentTermOptions,
    required this.onPaymentTermChanged,
    required this.preferNotToSpecify,
    required this.onPreferNotToSpecifyChanged,
  });

  void _openPaymentTermPicker(BuildContext context) {
    SearchBottomSheet.show(
      context,
      'Payment Term',
      paymentTermOptions,
      (item) => onPaymentTermChanged(item.label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Expected Payment',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: IthakiTheme.textPrimary),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('From', style: TextStyle(fontSize: 12, color: IthakiTheme.textSecondary)),
                  const SizedBox(height: 4),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: IthakiTheme.borderLight),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: amountController,
                            enabled: !preferNotToSpecify,
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            style: const TextStyle(fontSize: 14, color: IthakiTheme.textPrimary),
                            decoration: const InputDecoration(
                              hintText: '0',
                              hintStyle: TextStyle(color: IthakiTheme.textHint),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text('€', style: TextStyle(fontSize: 16, color: IthakiTheme.textSecondary)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Payment Term', style: TextStyle(fontSize: 12, color: IthakiTheme.textSecondary)),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: preferNotToSpecify ? null : () => _openPaymentTermPicker(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: paymentTerm != null ? IthakiTheme.primaryPurple : IthakiTheme.borderLight,
                          width: paymentTerm != null ? 1.5 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              paymentTerm ?? 'Monthly',
                              style: TextStyle(
                                fontSize: 14,
                                color: paymentTerm != null ? IthakiTheme.textPrimary : IthakiTheme.textHint,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down, size: 18, color: IthakiTheme.textSecondary),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        IthakiCheckbox(
          value: preferNotToSpecify,
          onChanged: (val) {
            if (val) amountController.clear();
            onPreferNotToSpecifyChanged(val);
          },
          child: const Text(
            'Prefer not to specify',
            style: TextStyle(fontSize: 13, color: IthakiTheme.textSecondary),
          ),
        ),
      ],
    );
  }
}
