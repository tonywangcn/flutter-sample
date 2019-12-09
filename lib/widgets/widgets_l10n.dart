import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common/l10n.dart';
import '../services/l10n_service.dart';

enum _LKeys { ok, yes, no }

class WidgetsL10n {
  static final Map<String, Map<_LKeys, String>> _localizedValues = {
    L10nService.enUS.toString(): {
      _LKeys.ok: "Ok",
      _LKeys.yes: "Yes",
      _LKeys.no: "No",
    },
    L10nService.ptBR.toString(): {
      _LKeys.ok: "Ok",
      _LKeys.yes: "Sim",
      _LKeys.no: "Não",
    },
  };

  String get ok => _localizedValues[locale.toString()][_LKeys.ok];
  String get yes => _localizedValues[locale.toString()][_LKeys.yes];
  String get no => _localizedValues[locale.toString()][_LKeys.no];

  final Locale locale;

  WidgetsL10n(this.locale);

  static const LocalizationsDelegate<dynamic> delegate = _WidgetsL10nDelegate();
}

class _WidgetsL10nDelegate extends AL10nDelegate<WidgetsL10n> {
  const _WidgetsL10nDelegate();

  @override
  Future<WidgetsL10n> load(Locale locale) => SynchronousFuture<WidgetsL10n>(WidgetsL10n(locale));
}
