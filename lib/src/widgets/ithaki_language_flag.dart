import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/ithaki_theme.dart';
import 'ithaki_flag.dart';
import 'ithaki_icon.dart';

class IthakiLanguageFlag extends StatelessWidget {
  final String language;
  final double size;

  const IthakiLanguageFlag(
    this.language, {
    super.key,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    final localAsset = languageLocalFlagAsset(language);
    if (localAsset != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: SvgPicture.asset(
          'packages/ithaki_design_system/assets/flags/local/$localAsset.svg',
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      );
    }

    final code = languageCountryCode(language);
    if (code != null && code.isNotEmpty) {
      return IthakiFlag(code, width: size, height: size);
    }

    return IthakiIcon('flag', size: size, color: IthakiTheme.softGraphite);
  }
}

String? languageLocalFlagAsset(String language) {
  final normalized = _normalizeLanguage(language);
  if (normalized.isEmpty) return null;

  if (_languageToLocalFlagAsset.containsKey(normalized)) {
    return _languageToLocalFlagAsset[normalized];
  }

  for (final entry in _languageToLocalFlagAsset.entries) {
    if (normalized.contains(entry.key)) {
      return entry.value;
    }
  }
  return null;
}

String? languageCountryCode(String language) {
  final normalized = _normalizeLanguage(language);
  if (normalized.isEmpty) return null;

  if (_languageToCountryCode.containsKey(normalized)) {
    return _languageToCountryCode[normalized]!.toLowerCase();
  }

  final parts = normalized
      .split(',')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();
  for (final part in parts) {
    if (_languageToCountryCode.containsKey(part)) {
      return _languageToCountryCode[part]!.toLowerCase();
    }
  }

  for (final entry in _languageToCountryCode.entries) {
    if (normalized.contains(entry.key)) {
      return entry.value.toLowerCase();
    }
  }

  return null;
}

String _normalizeLanguage(String value) {
  var normalized = value.toLowerCase();
  const replacements = {
    'á': 'a',
    'à': 'a',
    'ä': 'a',
    'â': 'a',
    'ã': 'a',
    'å': 'a',
    'ā': 'a',
    'é': 'e',
    'è': 'e',
    'ë': 'e',
    'ê': 'e',
    'ē': 'e',
    'í': 'i',
    'ì': 'i',
    'ï': 'i',
    'î': 'i',
    'ī': 'i',
    'ó': 'o',
    'ò': 'o',
    'ö': 'o',
    'ô': 'o',
    'õ': 'o',
    'ō': 'o',
    'ú': 'u',
    'ù': 'u',
    'ü': 'u',
    'û': 'u',
    'ū': 'u',
    'ñ': 'n',
    'ç': 'c',
    'ş': 's',
    'ğ': 'g',
    'ř': 'r',
    'ł': 'l',
    'ž': 'z',
    'š': 's',
    'ć': 'c',
    'đ': 'd',
    'ṭ': 't',
    'ṁ': 'm',
  };

  replacements.forEach((key, val) {
    normalized = normalized.replaceAll(key, val);
  });

  return normalized
      .replaceAll(RegExp(r'\(.*?\)'), '')
      .replaceAll(RegExp(r'[^a-z,\s-]'), ' ')
      .replaceAll('-', ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
}

const Map<String, String> _languageToLocalFlagAsset = {
  'basque': 'basque',
  'galician': 'galicia',
  'catalan': 'catalonia',
  'valencian': 'valencian_community',
  'castilian': 'castile',
  'occitan': 'occitania',
  'welsh': 'wales',
  'scottish gaelic': 'scotland',
  'gaelic': 'scotland',
  'breton': 'brittany',
  'cornish': 'cornwall',
  'western frisian': 'friesland',
  'frisian': 'friesland',
  'greenlandic': 'greenland',
  'kalaallisut': 'greenland',
  'kurdish': 'kurdistan',
  'sorani': 'kurdistan',
  'kurmanji': 'kurdistan',
};

const Map<String, String> _languageToCountryCode = {
  'abkhaz': 'GE',
  'afar': 'DJ',
  'afrikaans': 'ZA',
  'akan': 'GH',
  'albanian': 'AL',
  'amharic': 'ET',
  'arabic': 'SA',
  'armenian': 'AM',
  'assamese': 'IN',
  'azerbaijani': 'AZ',
  'bambara': 'ML',
  'bashkir': 'RU',
  'basque': 'ES',
  'belarusian': 'BY',
  'bengali': 'BD',
  'bosnian': 'BA',
  'breton': 'FR',
  'bulgarian': 'BG',
  'burmese': 'MM',
  'catalan': 'ES',
  'chinese': 'CN',
  'croatian': 'HR',
  'czech': 'CZ',
  'danish': 'DK',
  'dutch': 'NL',
  'english': 'GB',
  'estonian': 'EE',
  'faroese': 'FO',
  'fijian': 'FJ',
  'finnish': 'FI',
  'french': 'FR',
  'galician': 'ES',
  'georgian': 'GE',
  'german': 'DE',
  'greek': 'GR',
  'guarani': 'PY',
  'gujarati': 'IN',
  'haitian': 'HT',
  'haitian creole': 'HT',
  'hausa': 'NG',
  'hebrew': 'IL',
  'hindi': 'IN',
  'hungarian': 'HU',
  'indonesian': 'ID',
  'irish': 'IE',
  'igbo': 'NG',
  'icelandic': 'IS',
  'italian': 'IT',
  'japanese': 'JP',
  'javanese': 'ID',
  'kannada': 'IN',
  'kazakh': 'KZ',
  'khmer': 'KH',
  'kinyarwanda': 'RW',
  'korean': 'KR',
  'kurdish': 'IQ',
  'sorani': 'IQ',
  'kurmanji': 'TR',
  'lao': 'LA',
  'latin': 'IT',
  'latvian': 'LV',
  'lithuanian': 'LT',
  'luxembourgish': 'LU',
  'macedonian': 'MK',
  'malagasy': 'MG',
  'malay': 'MY',
  'malayalam': 'IN',
  'maltese': 'MT',
  'maori': 'NZ',
  'marathi': 'IN',
  'mongolian': 'MN',
  'nepali': 'NP',
  'norwegian': 'NO',
  'occitan': 'FR',
  'oriya': 'IN',
  'panjabi': 'IN',
  'punjabi': 'IN',
  'persian': 'IR',
  'farsi': 'IR',
  'dari': 'AF',
  'polish': 'PL',
  'portuguese': 'PT',
  'quechua': 'PE',
  'romanian': 'RO',
  'russian': 'RU',
  'sanskrit': 'IN',
  'serbian': 'RS',
  'slovak': 'SK',
  'slovene': 'SI',
  'somali': 'SO',
  'spanish': 'ES',
  'castilian': 'ES',
  'sundanese': 'ID',
  'swahili': 'KE',
  'swedish': 'SE',
  'tamil': 'IN',
  'telugu': 'IN',
  'thai': 'TH',
  'tibetan': 'CN',
  'tagalog': 'PH',
  'turkish': 'TR',
  'turkmen': 'TM',
  'uighur': 'CN',
  'uyghur': 'CN',
  'ukrainian': 'UA',
  'urdu': 'PK',
  'uzbek': 'UZ',
  'vietnamese': 'VN',
  'welsh': 'GB',
  'wolof': 'SN',
  'xhosa': 'ZA',
  'yiddish': 'IL',
  'yoruba': 'NG',
  'zarma': 'NE',
  'zhuang': 'CN',
};
