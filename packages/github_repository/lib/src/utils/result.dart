///A discriminated union that encapsulates a successful outcome with a value of type T or a failure with an arbitrary Throwable exception.
class Result<T> {
  final Object? value;

  Result._({required this.value});

  factory Result.success(T value) => Result._(value: value);

  factory Result.failure(Exception exception) =>
      Result._(value: Result.failure(exception));

  ///[return] `true` if this instance represents a successful outcome.
  bool get isSuccess => value is !_Failure;

  ///[return] `true` if this instance represents a failed outcome.
  bool get isFailure => value is _Failure;

  /// Returns the encapsulated value if this instance represents [success][Result.isSuccess] or `null` if it is [failure][Result.isFailure].
  T? getOrNull() {
    if (isFailure) {
      return null;
    } else {
      return value as T;
    }
  }

  /// Returns the encapsulated [Throwable] exception if this instance represents [failure][isFailure] or `null`  if it is [success][isSuccess].
  Exception? exceptionOrNull() {
    if (isFailure) {
      return (value as _Failure).exception;
    } else {
      return null;
    }
  }

  @override
  String toString() {
    if (isFailure) {
      return value.toString();
    } else {
      return "Success($value)";
    }
  }
}

class _Failure {
  Exception exception;

  _Failure({required this.exception});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _Failure &&
          runtimeType == other.runtimeType &&
          exception == other.exception;

  @override
  int get hashCode => exception.hashCode;

  @override
  String toString() {
    return 'Failure($exception)';
  }
}
