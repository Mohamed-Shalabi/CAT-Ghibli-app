class ResponseModel<T> {
  final int statusCode;
  final T? data;
  final String message;

  ResponseModel({
    required this.statusCode,
    this.data,
    this.message = '',
  });

  ResponseModel.unknownError()
      : statusCode = -1,
        data = null,
        message = 'An error occurred';

  ResponseModel.networkError()
      : statusCode = -1,
        data = null,
        message = 'Check your internet connection';
}
