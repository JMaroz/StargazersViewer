class ApiResponse<T> {
  final T? data;
  final String errorMessage;
  final Exception? exception;

  ApiResponse({
    this.data,
    this.errorMessage = "",
    this.exception,
  });

  bool get isSuccess =>
      data != null && exception == null && errorMessage.isEmpty;

  bool get isFailure => exception != null || errorMessage.isNotEmpty;
}
