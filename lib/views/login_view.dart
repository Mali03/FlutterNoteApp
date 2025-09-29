import 'package:flutter/material.dart';
import 'package:mynoteapp/constants/routes.dart';
import 'package:mynoteapp/services/auth/auth_exceptions.dart';
import 'package:mynoteapp/services/auth/auth_service.dart';
import 'package:mynoteapp/utilities/dialogs/error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  bool obscureText = true;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giriş yap"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Text("Not tutmaya başlamadan önce lütfen giriş yapın.", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "E-posta adresinizi girin.",
                    ),
                  ),
                  TextField(
                    controller: _password,
                    obscureText: obscureText,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: "Şifrenizi girin.",
                      suffixIcon: IconButton(
                        onPressed:
                            () => setState(() => obscureText = !obscureText),
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;

                      try {
                        await AuthService.firebase().logIn(
                          email: email,
                          password: password,
                        );

                        final user = AuthService.firebase().currentUser;
                        if (user?.isEmailVerified ?? false) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            notesRoute,
                            (route) => false,
                          );
                        } else {
                          await AuthService.firebase().sendEmailVerification();

                          Navigator.of(context).pushNamedAndRemoveUntil(
                            verifyEmailRoute,
                            (route) => false,
                          );
                        }
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
                    child: const Text('Giriş yap'),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        forgotPasswordRoute,
                        (router) => false,
                      );
                    },

                    child: Text("Şifremi unuttum"),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        registerRoute,
                        (router) => false,
                      );
                    },

                    child: Text("Kayıt ol"),
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
