import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynoteapp/firebase_options.dart';
import 'package:mynoteapp/views/login_view.dart';
import 'package:mynoteapp/views/register_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      routes: {
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            // final user = FirebaseAuth.instance.currentUser;
            // final emailVerified = user?.emailVerified ?? false;
            // print(user);
            // if (emailVerified) {
            //   return Text('Tamamlandi');
            // } else {
            //   return const VerifyEmailView();
            // }

            return const LoginView();
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}