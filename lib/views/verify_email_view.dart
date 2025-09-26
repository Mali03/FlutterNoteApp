import 'package:flutter/material.dart';
import 'package:mynoteapp/constants/routes.dart';
import 'package:mynoteapp/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-posta'nı doğrula"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Text("Doğrulama e-postası gönderdik. Lütfen gönderilen e-posta'dan doğrulamanızı yapın.\n\nEğer doğrulama e-postası gelmediyse aşağıdaki butona tıklayın."),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text("Doğrulama e-postası gönder."),
          ),
          const Text("\n\nE-posta üzerinden doğrulama yaptın mı?"),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();
              Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (route) => false);
            },
            child: const Text("Giriş yap"),
          ),
        ],
      ),
    );
  }
}
