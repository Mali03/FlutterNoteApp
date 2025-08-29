// Login exceptions

class InvalidCredentialAuthException implements Exception {}
class InvalidEmailAuthException implements Exception {}

// Register exceptions

class WeakPasswordAuthException implements Exception {}
class EmailAlreadyInUseAuthException implements Exception {}

// Generic exceptions

class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}