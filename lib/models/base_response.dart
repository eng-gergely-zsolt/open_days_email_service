class BaseResponse {
  int? errorCode;
  String? errorMessage;
  bool isOperationSuccessful;

  BaseResponse({
    this.isOperationSuccessful = false,
  });

  BaseResponse.withError({
    this.errorCode,
    this.errorMessage,
    this.isOperationSuccessful = false,
  });

  BaseResponse.fromJson(Map<String, dynamic> json)
      : errorCode = json['errorCode'],
        errorMessage = json['errorMessage'],
        isOperationSuccessful = json['isOperationSuccessful'];
}
