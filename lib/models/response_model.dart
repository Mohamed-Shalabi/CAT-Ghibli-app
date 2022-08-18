class ResponseModel<T> {
  final int statusCode;
  final T? data;
  final String message;

  ResponseModel({
    required this.statusCode,
    this.data,
    this.message = '',
  });

  ResponseModel.error()
      : statusCode = -1,
        message = 'An error occurred',
        data = null;

  ResponseModel.networkError()
      : statusCode = -1,
        message = 'Check your internet connection',
        data = null;
}
