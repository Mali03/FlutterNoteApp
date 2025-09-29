import 'package:flutter/material.dart';
import 'package:mynoteapp/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetEmailSentDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: "Şifre Sıfırla",
    content: "Şifre sıfırlama e-postası gönderdik. Lütfen e-posta adresinizi kontrol edin.",
    optionsBuilder: () => {'Tamam': null},
  );
}
