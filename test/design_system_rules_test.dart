import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('widgets use IthakiTheme tokens instead of raw colors', () {
    final violations = _widgetSourceLines().where((line) {
      return line.text.contains('Color(0x') || line.text.contains('Colors.');
    }).toList();

    expect(
      violations,
      isEmpty,
      reason: _formatViolations(violations),
    );
  });

  test('widgets use IthakiIcon instead of Material Icon APIs', () {
    final violations = _widgetSourceLines().where((line) {
      final text = line.text;
      final usesIconWidget =
          text.contains('Icon(') && !text.contains('IthakiIcon(');
      return text.contains('IconData') || usesIconWidget;
    }).toList();

    expect(
      violations,
      isEmpty,
      reason: _formatViolations(violations),
    );
  });
}

List<_SourceLine> _widgetSourceLines() {
  final widgetsDir = Directory('lib/src/widgets');
  return widgetsDir
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('.dart'))
      .expand((file) {
    final lines = file.readAsLinesSync();
    return Iterable.generate(lines.length, (index) {
      return _SourceLine(file.path, index + 1, lines[index].trim());
    });
  }).toList();
}

String _formatViolations(List<_SourceLine> violations) {
  return violations
      .map((line) => '${line.path}:${line.number}: ${line.text}')
      .join('\n');
}

class _SourceLine {
  final String path;
  final int number;
  final String text;

  const _SourceLine(this.path, this.number, this.text);
}
