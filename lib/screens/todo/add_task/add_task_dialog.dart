import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../common/widget.dart';
import '../../../models/todo/task_model.dart';
import '../../../services/router_service.dart';
import '../../../widgets/fields.dart';
import 'add_task_bloc.dart';
import 'add_task_l10n.dart';

class AddTaskDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends AStatefulWBL<AddTaskDialog, AddTaskBloc, AddTaskL10n> {
  @override
  final AddTaskBloc bloc = AddTaskBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  bool _isProcessing = false;
  TaskModelError _taskModelError;

  @override
  void initState() {
    super.initState();
    disposableFunctions.add(_nameController.dispose);
    bloc.states$.listen(_onData, onError: _onError);
  }

  void _onData(AddTaskBlocState state) {
    if (state is AddTaskBlocSuccess) {
      RouterService.instance.pop(context);
    }
  }

  void _onError(Object error) {
    setState(() {
      _isProcessing = false;
      _taskModelError = error is TaskModelError ? error : null;
      _formKey.currentState.validate();
    });
  }

  void _onSubmit() {
    setState(() {
      _isProcessing = true;
      final task = TaskModel(name: _nameController.value.text);
      bloc.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(l10n.title),
      content: Form(
        key: _formKey,
        child: TextInput(
          labelText: l10n.inputLabel,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          controller: _nameController,
          validator: (_) => _taskModelError?.name,
          enabled: !_isProcessing,
          autofocus: true,
          onFieldSubmitted: (_) => _onSubmit(),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(l10n.btnCancel),
          onPressed: _isProcessing ? null : () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text(l10n.btnAdd),
          onPressed: _isProcessing ? null : _onSubmit,
        ),
      ],
    );
  }
}
