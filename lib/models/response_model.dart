class ResponseModel<T> {
  final int statusCode;
  final T? data;
  final String message;

  ResponseModel({
    required this.statusCode,
    this.data,
    this.message = '',
  });
}
