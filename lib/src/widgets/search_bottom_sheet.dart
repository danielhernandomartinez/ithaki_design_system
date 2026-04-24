import 'package:flutter/material.dart';
import '../models/search_item.dart';
import '../theme/ithaki_theme.dart';
import 'ithaki_button.dart';
import 'ithaki_icon.dart';

class SearchBottomSheet extends StatefulWidget {
  final String title;
  final List<SearchItem> items;
  final ValueChanged<SearchItem> onSelect;
  final String searchHint;
  final String selectLabel;

  const SearchBottomSheet({
    super.key,
    required this.title,
    required this.items,
    required this.onSelect,
    this.searchHint = 'Search...',
    this.selectLabel = 'Select',
  });

  static void show(
    BuildContext context,
    String title,
    List<SearchItem> items,
    ValueChanged<SearchItem> onSelect, {
    String searchHint = 'Search...',
    String selectLabel = 'Select',
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: IthakiTheme.backgroundWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => SearchBottomSheet(
        title: title,
        items: items,
        onSelect: onSelect,
        searchHint: searchHint,
        selectLabel: selectLabel,
      ),
    );
  }

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  final _searchController = TextEditingController();
  SearchItem? _selected;
  List<SearchItem> _filtered = [];

  @override
  void initState() {
    super.initState();
    _filtered = widget.items;
    _searchController.addListener(_onSearch);
  }

  void _onSearch() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filtered = query.isEmpty
          ? widget.items
          : widget.items
              .where((item) => item.label.toLowerCase().contains(query))
              .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            // Handle bar
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: IthakiTheme.borderLight,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 12),
            // Title row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(widget.title, style: IthakiTheme.sectionTitle),
                  const Spacer(),
                  IconButton(
                    icon: const IthakiIcon('x-close', size: 20),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Search field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: widget.searchHint,
                  hintStyle: IthakiTheme.hintStyle,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide:
                        const BorderSide(color: IthakiTheme.borderLight),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide:
                        const BorderSide(color: IthakiTheme.borderLight),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                        color: IthakiTheme.primaryPurple, width: 1.5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // List
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: _filtered.length,
                itemBuilder: (context, index) {
                  final item = _filtered[index];
                  final isSelected = _selected?.id == item.id;
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () => setState(() => _selected = item),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? IthakiTheme.cardBackground : null,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        child: Row(
                          children: [
                            if (isSelected) ...[
                              const IthakiIcon('check',
                                  size: 18, color: IthakiTheme.textPrimary),
                              const SizedBox(width: 8),
                              if (item.leadingWidget != null)
                                item.leadingWidget!,
                            ] else if (item.leadingWidget != null)
                              item.leadingWidget!
                            else
                              const SizedBox(width: 18),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(item.label,
                                  style: IthakiTheme.bodySmallMedium,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            if (item.subtitle.isNotEmpty) ...[
                              const SizedBox(width: 8),
                              Text(item.subtitle,
                                  style: IthakiTheme.captionRegular,
                                  overflow: TextOverflow.ellipsis),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Select button
            Padding(
              padding: EdgeInsets.fromLTRB(
                  16,
                  8,
                  16,
                  MediaQuery.of(context).viewInsets.bottom +
                      MediaQuery.of(context).padding.bottom +
                      16),
              child: IthakiButton(
                widget.selectLabel,
                isEnabled: _selected != null,
                onPressed: _selected != null
                    ? () {
                        widget.onSelect(_selected!);
                        Navigator.of(context).pop();
                      }
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}
