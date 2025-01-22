class UnknownException implements Exception {
  UnknownException(this.message, this.statusCode);

  final dynamic message;
  final String statusCode;
}

class UnAuthorizedAccess implements Exception {
  UnAuthorizedAccess(this.message, this.statusCode);

  final dynamic message;
  final String statusCode;
}
