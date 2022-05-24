class UnexpectedException implements Exception {
  final String? message;
  final dynamic cause;

  UnexpectedException({
    this.message,
    this.cause,
  });

  @override
  String toString() {
    return 'UnexpectedException{message: $message, cause: $cause}';
  }
}
