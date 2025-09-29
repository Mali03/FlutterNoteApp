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
  bool _obscureText1 = true;
  bool _obscureText2 = true;

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
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[100], // gri arka plan
                borderRadius: BorderRadius.circular(8), // köşeleri yuvarlat
              ),
              child: Column(
                children: [
                  const Text(
                    "Kayıt olmak için aşağıdaki bilgileri doldurun.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "E-posta adresinizi girin.",
                    ),
                  ),
                  const SizedBox(height: 10), // araya boşluk
                  TextField(
                    controller: _password,
                    obscureText: _obscureText1,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: "Şifrenizi girin.",
                      suffixIcon: IconButton(
                        onPressed:
                            () =>
                                setState(() => _obscureText1 = !_obscureText1),
                        icon: Icon(
                          _obscureText1
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _passwordAgain,
                    obscureText: _obscureText2,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: "Şifrenizi tekrar girin.",
                      suffixIcon: IconButton(
                        onPressed:
                            () =>
                                setState(() => _obscureText2 = !_obscureText2),
                        icon: Icon(
                          _obscureText2
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      final passwordAgain = _passwordAgain.text;

                      if (password != passwordAgain) {
                        return await showErrorDialog(
                          context,
                          "Girilen şifreler uyuşmuyor. Lütfen tekrar deneyin.",
                        );
                      }

                      try {
                        await AuthService.firebase().createUser(
                          email: email,
                          password: password,
                        );

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
            ),
          ],
        ),
      ),
    );
  }
}
