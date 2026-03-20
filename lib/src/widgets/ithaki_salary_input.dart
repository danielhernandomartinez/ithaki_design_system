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
  final String expectedPaymentLabel;
  final String fromLabel;
  final String paymentTermLabel;
  final String paymentTermPlaceholder;
  final String currencySymbol;
  final String preferNotToSpecifyLabel;
  final String paymentTermPickerTitle;
  final String paymentTermPickerSearchHint;
  final String paymentTermPickerSelectLabel;

  const IthakiSalaryInput({
    super.key,
    required this.amountController,
    required this.paymentTerm,
    required this.paymentTermOptions,
    required this.onPaymentTermChanged,
    required this.preferNotToSpecify,
    required this.onPreferNotToSpecifyChanged,
    this.expectedPaymentLabel = 'Expected Payment',
    this.fromLabel = 'From',
    this.paymentTermLabel = 'Payment Term',
    this.paymentTermPlaceholder = 'Monthly',
    this.currencySymbol = '€',
    this.preferNotToSpecifyLabel = 'Prefer not to specify',
    this.paymentTermPickerTitle = 'Payment Term',
    this.paymentTermPickerSearchHint = 'Search...',
    this.paymentTermPickerSelectLabel = 'Select',
  });

  void _openPaymentTermPicker(BuildContext context) {
    SearchBottomSheet.show(
      context,
      paymentTermPickerTitle,
      paymentTermOptions,
      (item) => onPaymentTermChanged(item.label),
      searchHint: paymentTermPickerSearchHint,
      selectLabel: paymentTermPickerSelectLabel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          expectedPaymentLabel,
          style: IthakiTheme.fieldLabel,
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
                  Text(fromLabel, style: IthakiTheme.captionRegular),
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
                            style: IthakiTheme.bodySmall,
                            decoration: const InputDecoration(
                              hintText: '0',
                              hintStyle: IthakiTheme.hintStyle,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(currencySymbol, style: IthakiTheme.bodySecondary),
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
                  Text(paymentTermLabel, style: IthakiTheme.captionRegular),
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
                              paymentTerm ?? paymentTermPlaceholder,
                              style: IthakiTheme.bodySmall.copyWith(
                                color: paymentTerm != null ? IthakiTheme.textPrimary : IthakiTheme.softGraphite,
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
          child: Text(
            preferNotToSpecifyLabel,
            style: IthakiTheme.captionRegular,
          ),
        ),
      ],
    );
  }
}
