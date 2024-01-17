class ResponseData {
  final bool isSuccess;
  final int StatusCode;
  final dynamic responseData;
  final String errorMessage;

  ResponseData(
      {required this.isSuccess,
      required this.StatusCode,
      required this.responseData,
       this.errorMessage = 'something is wrong'});
}
