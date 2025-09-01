import 'package:flutter/material.dart';
import 'package:mynoteapp/utilities/dialogs/generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Çıkış Yap',
    content: 'Çıkış yapmak istediğinize emin misiniz?',
    optionsBuilder: () => {'Evet': true, 'Hayır': false},
  ).then((value) => value ?? false);
}
