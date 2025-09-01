import 'package:flutter/material.dart';
import 'package:mynoteapp/constants/routes.dart';
import 'package:mynoteapp/services/auth/auth_exceptions.dart';
import 'package:mynoteapp/services/auth/auth_service.dart';
import 'package:mynoteapp/utilities/dialogs/error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _passwordAgain;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _passwordAgain = TextEditingController();
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
          TextField(
            controller: _passwordAgain,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: "Lütfen şifrenizi tekrar girin.",
            ),
          ),

          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              final passwordAgain = _passwordAgain.text;

              if (password != passwordAgain) {
                return await showErrorDialog(context, "Girilen şifreler uyuşmuyor. Lütfen tekrar deneyin.");
              }

              try {
                await AuthService.firebase().createUser(email: email, password: password);

                await AuthService.firebase().sendEmailVerification();

                Navigator.of(context).pushNamed(verifyEmailRoute);

              } on WeakPasswordAuthException {
                  await showErrorDialog(
                    context,
                    "Şifre en az 6 karakter uzunluğunda olmalı. Lütfen tekrar deneyin.",
                  );
              } on EmailAlreadyInUseAuthException {
                await showErrorDialog(
                    context,
                    "Bu e-mail kullanılıyor. Lütfen tekrar deneyin.",
                  );
              } on InvalidEmailAuthException {
                await showErrorDialog(
                    context,
                    "Geçersiz e-mail adresi. Lütfen tekrar deneyin.",
                  );
              } on GenericAuthException {
                await showErrorDialog(
                  context,
                  "Kayıt olma hatası. Lütfen tekrar deneyin.",
                );
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
