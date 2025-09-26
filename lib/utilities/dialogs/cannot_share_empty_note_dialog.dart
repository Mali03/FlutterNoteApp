import 'package:flutter/material.dart';
import 'package:mynoteapp/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: "Paylaş",
    content: "Bu notun içeriği boş olduğu için paylaşılamıyor.",
    optionsBuilder: () => {'OK': null},
  );
}
