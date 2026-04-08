import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/ithaki_theme.dart';

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
      return _uniformFlagFrame(
        SvgPicture.asset(
          'packages/ithaki_design_system/assets/flags/$localAsset.svg',
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      );
    }

    final code = languageCountryCode(language);
    if (code != null && code.isNotEmpty) {
      return _uniformFlagFrame(
        SvgPicture.asset(
          'packages/ithaki_design_system/assets/flags/$code.svg',
          width: size,
          height: size,
          fit: BoxFit.cover,
          placeholderBuilder: (_) => SizedBox(width: size, height: size),
        ),
      );
    }

    return _uniformFlagFrame(
      SvgPicture.asset(
        'packages/ithaki_design_system/assets/flags/un.svg',
        width: size,
        height: size,
        fit: BoxFit.cover,
        placeholderBuilder: (_) => SizedBox(width: size, height: size),
      ),
    );
  }

  Widget _uniformFlagFrame(Widget child, {bool addSoftBg = false}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: addSoftBg ? IthakiTheme.softGray : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
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
    'ă': 'a',
    'ą': 'a',
    'é': 'e',
    'è': 'e',
    'ë': 'e',
    'ê': 'e',
    'ē': 'e',
    'ě': 'e',
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
    'ý': 'y',
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
  'aragonese': 'aragon',
  'corsican': 'corsica',
  'manx': 'isle_of_man',
  'navajo': 'navajo_nation',
  'navaho': 'navajo_nation',
  'occitan': 'occitania',
  'welsh': 'wales',
  'scottish gaelic': 'scotland',
  'gaelic': 'scotland',
  'northern sami': 'sapmi',
  'sami': 'sapmi',
  'breton': 'brittany',
  'cornish': 'cornwall',
  'western frisian': 'friesland',
  'frisian': 'friesland',
  'maori': 'maori_tino_rangatiratanga',
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
  'aragonese': 'ES',
  'assamese': 'IN',
  'avaric': 'RU',
  'avestan': 'IR',
  'aymara': 'BO',
  'azerbaijani': 'AZ',
  'bambara': 'ML',
  'bashkir': 'RU',
  'basque': 'ES',
  'belarusian': 'BY',
  'bengali': 'BD',
  'bihari': 'IN',
  'bislama': 'VU',
  'bini': 'NG',
  'edo': 'NG',
  'bosnian': 'BA',
  'bokmal': 'NO',
  'breton': 'FR',
  'bulgarian': 'BG',
  'burmese': 'MM',
  'catalan': 'ES',
  'chamorro': 'GU',
  'chechen': 'RU',
  'chewa': 'MW',
  'chichewa': 'MW',
  'nyanja': 'MW',
  'chinese': 'CN',
  'chuvash': 'RU',
  'cornish': 'GB',
  'corsican': 'FR',
  'cree': 'CA',
  'croatian': 'HR',
  'czech': 'CZ',
  'danish': 'DK',
  'divehi': 'MV',
  'dhivehi': 'MV',
  'maldivian': 'MV',
  'dutch': 'NL',
  'english': 'GB',
  'esperanto': 'UN',
  'estonian': 'EE',
  'ewe': 'GH',
  'faroese': 'FO',
  'fijian': 'FJ',
  'finnish': 'FI',
  'french': 'FR',
  'fulah': 'SN',
  'pulaar': 'SN',
  'pular': 'SN',
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
  'herero': 'NA',
  'hindi': 'IN',
  'hiri motu': 'PG',
  'hungarian': 'HU',
  'interlingua': 'UN',
  'interlingue': 'UN',
  'irish': 'IE',
  'igbo': 'NG',
  'inupiaq': 'US',
  'ido': 'UN',
  'icelandic': 'IS',
  'italian': 'IT',
  'inuktitut': 'CA',
  'japanese': 'JP',
  'javanese': 'ID',
  'kannada': 'IN',
  'kanuri': 'NG',
  'kashmiri': 'IN',
  'kazakh': 'KZ',
  'khmer': 'KH',
  'kikuyu': 'KE',
  'gikuyu': 'KE',
  'kinyarwanda': 'RW',
  'kyrgyz': 'KG',
  'kirghiz': 'KG',
  'komi': 'RU',
  'kongo': 'CD',
  'korean': 'KR',
  'kurdish': 'IQ',
  'sorani': 'IQ',
  'kurmanji': 'TR',
  'kwanyama': 'AO',
  'kuanyama': 'AO',
  'latin': 'VA',
  'luganda': 'UG',
  'limburgish': 'NL',
  'limburgan': 'NL',
  'limburger': 'NL',
  'lingala': 'CD',
  'lao': 'LA',
  'lithuanian': 'LT',
  'luba katanga': 'CD',
  'latvian': 'LV',
  'manx': 'IM',
  'macedonian': 'MK',
  'malagasy': 'MG',
  'malay': 'MY',
  'malayalam': 'IN',
  'maltese': 'MT',
  'maori': 'NZ',
  'marathi': 'IN',
  'marshallese': 'MH',
  'mongolian': 'MN',
  'nauru': 'NR',
  'navajo': 'US',
  'navaho': 'US',
  'norwegian bokmal': 'NO',
  'north ndebele': 'ZW',
  'nepali': 'NP',
  'ndonga': 'NA',
  'norwegian nynorsk': 'NO',
  'nynorsk': 'NO',
  'norwegian': 'NO',
  'nuosu': 'CN',
  'south ndebele': 'ZA',
  'occitan': 'FR',
  'ojibwe': 'CA',
  'ojibwa': 'CA',
  'old church slavonic': 'BG',
  'church slavic': 'BG',
  'church slavonic': 'BG',
  'old bulgarian': 'BG',
  'old slavonic': 'BG',
  'oromo': 'ET',
  'oriya': 'IN',
  'ossetian': 'GE',
  'ossetic': 'GE',
  'panjabi': 'IN',
  'punjabi': 'IN',
  'pali': 'IN',
  'persian': 'IR',
  'farsi': 'IR',
  'polish': 'PL',
  'pashto': 'AF',
  'pushto': 'AF',
  'portuguese': 'PT',
  'quechua': 'PE',
  'romansh': 'CH',
  'kirundi': 'BI',
  'romanian': 'RO',
  'russian': 'RU',
  'sanskrit': 'IN',
  'sardinian': 'IT',
  'sindhi': 'PK',
  'northern sami': 'NO',
  'samoan': 'WS',
  'sango': 'CF',
  'serbian': 'RS',
  'scottish gaelic': 'GB',
  'gaelic': 'GB',
  'shona': 'ZW',
  'sinhala': 'LK',
  'sinhalese': 'LK',
  'slovak': 'SK',
  'slovene': 'SI',
  'somali': 'SO',
  'southern sotho': 'LS',
  'spanish': 'ES',
  'sundanese': 'ID',
  'swahili': 'KE',
  'swati': 'SZ',
  'swedish': 'SE',
  'tamil': 'IN',
  'telugu': 'IN',
  'tajik': 'TJ',
  'thai': 'TH',
  'tigrinya': 'ER',
  'tibetan': 'CN',
  'turkmen': 'TM',
  'tagalog': 'PH',
  'tswana': 'BW',
  'tonga islands': 'TO',
  'tongan': 'TO',
  'turkish': 'TR',
  'tsonga': 'ZA',
  'tatar': 'RU',
  'twi': 'GH',
  'tahitian': 'PF',
  'uighur': 'CN',
  'uyghur': 'CN',
  'ukrainian': 'UA',
  'urdu': 'PK',
  'uzbek': 'UZ',
  'venda': 'ZA',
  'vietnamese': 'VN',
  'volapuk': 'UN',
  'walloon': 'BE',
  'welsh': 'GB',
  'wolof': 'SN',
  'western frisian': 'NL',
  'xhosa': 'ZA',
  'yiddish': 'IL',
  'yoruba': 'NG',
  'zhuang': 'CN',
  'chuang': 'CN',
  'valencian': 'ES',
  'castilian': 'ES',
  'dari': 'AF',
  'nigerian native language': 'NG',
  'eritrean native language': 'ER',
  'ika': 'NG',
  'susu': 'GN',
  'creole': 'HT',
  'krio': 'SL',
  'tem': 'TG',
  'kotokoli': 'TG',
  'zarma': 'NE',
  'kituba': 'CG',
  'mandinka': 'GM',
};
