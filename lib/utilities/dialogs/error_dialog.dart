import 'package:flutter/material.dart';
import 'package:mynoteapp/utilities/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog<void>(
    context: context,
    title: 'Bir hata oluştu.',
    content: text,
    optionsBuilder: () => {
      'Tamam': null,
    },
  );
}