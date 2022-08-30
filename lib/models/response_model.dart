class ResponseModel<T> {
  final T? data;
  final String message;

  ResponseModel.success({required this.data}) : message = '';

  ResponseModel.unknownError()
      : data = null,
        message = 'An error occurred';

  ResponseModel.networkError()
      : data = null,
        message = 'Check your internet connection';

  bool get isError => data == null;
}
