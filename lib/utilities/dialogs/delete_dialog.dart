import 'package:flutter/material.dart';
import 'package:mynoteapp/utilities/dialogs/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Sil',
    content: 'Notu silmek istediğinize emin misiniz?',
    optionsBuilder: () => {'Evet': true, 'Hayır': false},
  ).then((value) => value ?? false);
}
