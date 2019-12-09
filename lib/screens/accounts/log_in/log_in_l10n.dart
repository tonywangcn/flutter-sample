import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../common/l10n.dart';
import '../../../services/l10n_service.dart';

enum _LKeys {
  title,
  formUsername,
  formPassword,
  formSubmit,
}

class LogInL10n {
  static final Map<String, Map<_LKeys, String>> _localizedValues = {
    L10nService.enUS.toString(): {
      _LKeys.title: "Log In",
      _LKeys.formUsername: "Username or email",
      _LKeys.formPassword: "Password",
      _LKeys.formSubmit: "Log In",
    },
    L10nService.ptBR.toString(): {
      _LKeys.title: "Acesse",
      _LKeys.formUsername: "Nome de usuário ou email",
      _LKeys.formPassword: "Senha",
      _LKeys.formSubmit: "Acessar",
    },
  };

  String get title => _localizedValues[locale.toString()][_LKeys.title];
  String get formUsername => _localizedValues[locale.toString()][_LKeys.formUsername];
  String get formPassword => _localizedValues[locale.toString()][_LKeys.formPassword];
  String get formSubmit => _localizedValues[locale.toString()][_LKeys.formSubmit];

  final Locale locale;

  LogInL10n(this.locale);

  static const LocalizationsDelegate<dynamic> delegate = _LogInL10nDelegate();
}

class _LogInL10nDelegate extends AL10nDelegate<LogInL10n> {
  const _LogInL10nDelegate();

  @override
  Future<LogInL10n> load(Locale locale) => SynchronousFuture<LogInL10n>(LogInL10n(locale));
}
