import 'package:flutter/material.dart';

class SearchItem {
  final String id;
  final String label;
  final String subtitle;
  final Widget? leadingWidget;

  const SearchItem({
    required this.id,
    required this.label,
    this.subtitle = '',
    this.leadingWidget,
  });
}
