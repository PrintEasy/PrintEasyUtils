class RepoResponse<T> {
  const RepoResponse({
    this.message,
    this.hasError = false,
    this.data,
    this.statusCode,
  });

  final String? message;
  final bool hasError;
  final T? data;
  final int? statusCode;

  @override
  String toString() => 'RepoResponse(message: $message, hasError: $hasError, data: $data, statusCode: $statusCode)';
}
