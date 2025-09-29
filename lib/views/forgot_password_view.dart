import 'package:flutter/material.dart';
import 'package:mynoteapp/constants/routes.dart';
import 'package:mynoteapp/services/auth/auth_exceptions.dart';
import 'package:mynoteapp/services/auth/auth_service.dart';
import 'package:mynoteapp/utilities/dialogs/error_dialog.dart';
import 'package:mynoteapp/utilities/dialogs/password_reset_email_sent_dialog.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Şifreni Sıfırla"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Text(
                    "Şifre sıfırlama e-postası gönderilecek adresi gir.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    autofocus: true,
                    enableSuggestions: false,
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'E-posta adresini girin.',
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final email = _controller.text;
                      try {
                        await AuthService.firebase().sendPasswordReset(
                          email: email,
                        );

                        return showPasswordResetEmailSentDialog(context);
                      } on InvalidCredentialAuthException {
                        await showErrorDialog(
                          context,
                          "E-mail veya şifre hatalı. Lütfen tekrar deneyin.",
                        );
                      } on InvalidEmailAuthException {
                        await showErrorDialog(
                          context,
                          "Geçersiz e-mail adresi. Lütfen tekrar deneyin.",
                        );
                      } on GenericAuthException {
                        await showErrorDialog(
                          context,
                          "Kimlik doğrulama hatası. Lütfen tekrar deneyin.",
                        );
                      }
                    },
                    child: const Text('Gönder'),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamedAndRemoveUntil(loginRoute, (route) => false);
                    },
                    child: const Text('Giriş yap'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
