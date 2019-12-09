import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../common/l10n.dart';
import '../../../services/l10n_service.dart';

enum _LKeys {
  title,
  inputLabel,
  btnAdd,
  btnCancel,
}

class AddTaskL10n {
  final Locale locale;

  AddTaskL10n(this.locale);

  static final Map<String, Map<_LKeys, String>> _localizedValues = {
    L10nService.enUS.toString(): {
      _LKeys.title: "Add task",
      _LKeys.inputLabel: "Name your task",
      _LKeys.btnAdd: "Add",
      _LKeys.btnCancel: "Cancel",
    },
    L10nService.ptBR.toString(): {
      _LKeys.title: "Adicionar tarefa",
      _LKeys.inputLabel: "Dê um nome a sua tarefa",
      _LKeys.btnAdd: "Adiconar",
      _LKeys.btnCancel: "Cancelar",
    },
  };

  String get title => _localizedValues[locale.toString()][_LKeys.title];
  String get inputLabel => _localizedValues[locale.toString()][_LKeys.inputLabel];
  String get btnAdd => _localizedValues[locale.toString()][_LKeys.btnAdd];
  String get btnCancel => _localizedValues[locale.toString()][_LKeys.btnCancel];

  static const LocalizationsDelegate<dynamic> delegate = _AddTaskL10nDelegate();
}

class _AddTaskL10nDelegate extends AL10nDelegate<AddTaskL10n> {
  const _AddTaskL10nDelegate();

  @override
  Future<AddTaskL10n> load(Locale locale) => SynchronousFuture<AddTaskL10n>(AddTaskL10n(locale));
}
