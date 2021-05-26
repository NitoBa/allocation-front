enum NetworkErrorsType {
  timeout,
}

abstract class Failure implements Exception {
  String get message;
}

class ErrorMessage extends Failure {
  final String message;
  final NetworkErrorsType? typeError;
  ErrorMessage({required this.message, this.typeError});
}

class ErrorGetAllocation extends Failure {
  final String message;
  ErrorGetAllocation({required this.message});
}
