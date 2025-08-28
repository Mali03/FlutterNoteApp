import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' show log;

import 'package:mynoteapp/constants/routes.dart';
import 'package:mynoteapp/utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

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
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Lütfen e-mail'inizi girin.",
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: "Lütfen şifrenizi girin.",
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;

              try {
                final userCredential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                log(userCredential.toString());
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil(notesRoute, (route) => false);
              } on FirebaseAuthException catch (e) {
                log(e.code);
                if (e.code == "invalid-credential") {
                  log(
                    "Kullanıcı bulunamadı. (E-mail: ${email} Password: ${password})",
                  );
                  await showErrorDialog(context, "E-mail veya şifre hatalı. Lütfen tekrar deneyin.");
                } else if (e.code == "invalid-email") {
                  log(
                    "Geçersiz e-mail. (E-mail: ${email} Password: ${password})",
                  );
                  await showErrorDialog(context, "Geçersiz e-mail adresi. Lütfen tekrar deneyin.");
                } else {
                  await showErrorDialog(context, "Beklenmedik bir hata oluştu: ${e.code}");
                }
              } catch (e) {
                await showErrorDialog(context, e.toString());
              }
            },
            child: const Text('Giriş yap'),
          ),

          TextButton(
            onPressed: () {
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(registerRoute, (router) => false);
            },

            child: Text("Kayıt ol"),
          ),
        ],
      ),
    );
  }
}
