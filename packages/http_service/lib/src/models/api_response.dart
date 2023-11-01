abstract class ApiResponse<T> {
  void check({
    required void Function(T) onSuccess,
    required void Function(dynamic) onError,
  }) {
    if (this is ApiSuccess) {
      onSuccess((this as ApiSuccess<T>).response);
    } else if (this is ApiError) {
      onError((this as ApiError<T>).error);
    }
  }

  T get asSuccess => (this as ApiSuccess<T>).response;
  dynamic get asError => (this as ApiError<T>).error;

  bool get isSuccess => this is ApiSuccess;
  bool get isEmptyResponse => this is ApiEmptyResponse;
  bool get isError => this is ApiError;
}

class ApiSuccess<T> extends ApiResponse<T> {
  ApiSuccess(this.response);
  final T response;
}

class ApiEmptyResponse<T> extends ApiResponse<T> {
  ApiEmptyResponse();
}

class ApiError<T> extends ApiResponse<T> {
  ApiError(this.error);
  final dynamic error;
}
