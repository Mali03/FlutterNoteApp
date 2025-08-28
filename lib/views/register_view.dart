import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' show log;
import 'package:mynoteapp/constants/routes.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
        title: const Text("Kayıt ol"),
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
                    .createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                log(userCredential.toString());
              } on FirebaseAuthException catch (e) {
                log((e.code).toString());
                if (e.code == "weak-password") {
                  log(
                    "Zayıf şifre. Şifre en az 6 karakter uzunluğunda olmalı.",
                  );
                } else if (e.code == "email-already-in-use") {
                  log("Bu e-mail kullanılıyor.");
                } else if (e.code == "invalid-email") {
                  log("Geçersiz e-mail adresi girdiniz.");
                }
              }
            },
            child: const Text('Kayıt ol'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(loginRoute, (router) => false);
            },
            child: const Text("Giriş yap"),
          ),
        ],
      ),
    );
  }
}
