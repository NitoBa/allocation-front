enum NetworkErrorsType {
  timeout,
}

abstract class Failure implements Exception {
  String get message;
}

class ErrorMessage extends Failure {
  final String message;
  ErrorMessage({required this.message});
}
