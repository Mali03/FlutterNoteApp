import 'package:flutter/material.dart';
import 'package:mynoteapp/constants/routes.dart';
import 'package:mynoteapp/services/auth/auth_service.dart';
import 'package:mynoteapp/views/forgot_password_view.dart';
import 'package:mynoteapp/views/login_view.dart';
import 'package:mynoteapp/views/notes/notes_view.dart';
import 'package:mynoteapp/views/register_view.dart';
import 'package:mynoteapp/views/verify_email_view.dart';
import 'package:mynoteapp/views/notes/create_update_note_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      title: 'My Notes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        forgotPasswordRoute: (context) => const ForgotPasswordView(),
        notesRoute: (context) => const NotesView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        createUpdateRoute: (context) => const CreateUpdateNoteView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;

            if (user != null) {
              if (user.isEmailVerified) {
                return const NotesView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return Scaffold(
              backgroundColor: Colors.white,
              body: const Center(child: CircularProgressIndicator(color: Colors.black)),
            );
        }
      },
    );
  }
}
