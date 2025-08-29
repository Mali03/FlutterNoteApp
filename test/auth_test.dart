import 'package:mynoteapp/services/auth/auth_exceptions.dart';
import 'package:mynoteapp/services/auth/auth_provider.dart';
import 'package:mynoteapp/services/auth/auth_user.dart';
import 'package:test/test.dart';

void main() {
  group('Sahte kimlik doğrulama', () {
    final provider = MockAuthProvider();
    test('Başlangıçta başlatılmamalıdır.', () {
      expect(provider.isInitialized, false);
    });

    test('Başlatılmadıysa çıkış yapılamaz.', () {
      expect(
        provider.logOut(),
        throwsA(const TypeMatcher<UserNotLoggedInAuthException>()),
      );
    });

    test('Başlatılmalı', () async {
      await provider.initialize();
      expect(provider.isInitialized, true);
    });

    test('Başladıktan sonra user null olmalı.', () {
      expect(provider.currentUser, null);
    });

    test(
      '2 saniyeden az bir sürede başlatılmalı.',
      () async {
        await provider.initialize();
        expect(provider.isInitialized, true);
      },
      timeout: const Timeout(Duration(seconds: 2)),
    );

    test('Kullanıcı oluşturmak login fonksiyonunu çağırmalı.', () async {
      final badEmailUser = await provider.createUser(
        email: "foo@bar.com",
        password: "anypassword",
      );

      expect(
        badEmailUser,
        throwsA(const TypeMatcher<InvalidEmailAuthException>()),
      );

      final badPasswordUser = await provider.createUser(
        email: "someone@bar.com",
        password: 'foobar',
      );

      expect(
        badPasswordUser,
        throwsA(const TypeMatcher<InvalidCredentialAuthException>()),
      );

      final user = await provider.createUser(email: 'foo', password: 'bar');

      expect(provider.currentUser, user);
      expect(user.isEmailVerified, false);
    });

    test('Giriş yapan kullanıcı doğrulayabilmeli.', () async {
      provider.sendEmailVerification();
      final user = provider.currentUser;
      expect(user, isNotNull);
      expect(user!.isEmailVerified, true);
    });

    test('Tekrardan çıkış yapıp giriş yapabilmeli.', () async {
      await provider.logOut();
      await provider.logIn(email: "email", password: "password");

      final user = provider.currentUser;
      expect(user, isNotNull);
    });
  });
}

class NotInitializedException implements Exception {}

class MockAuthProvider implements AuthProvider {
  AuthUser? _user;
  var _isInitialized = false;
  bool get isInitialized => _isInitialized;

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    if (!isInitialized) throw NotInitializedException();
    await Future.delayed(const Duration(seconds: 1));
    return logIn(email: email, password: password);
  }

  @override
  AuthUser? get currentUser => _user;

  @override
  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 1));
    _isInitialized = true;
  }

  @override
  Future<AuthUser> logIn({required String email, required String password}) {
    if (!isInitialized) throw NotInitializedException();
    if (email == 'foo@bar.com') throw InvalidEmailAuthException();
    if (password == "foobar") throw InvalidCredentialAuthException();
    const user = AuthUser(isEmailVerified: false);
    _user = user;
    return Future.value(user);
  }

  @override
  Future<void> logOut() async {
    if (!isInitialized) throw NotInitializedException();
    if (_user == null) throw UserNotLoggedInAuthException();
    await Future.delayed(const Duration(seconds: 1));
    _user = null;
  }

  @override
  Future<void> sendEmailVerification() async {
    if (!isInitialized) throw NotInitializedException();
    final user = _user;
    if (user == null) throw UserNotLoggedInAuthException();
    const newUser = AuthUser(isEmailVerified: true);
    _user = newUser;
  }
}
