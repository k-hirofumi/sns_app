class ErrorResponse {
  ErrorResponse({
    required this.code,
    required this.message,
  });
  
  final int code;
  final String message;

  static ErrorResponse fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      code: json['code'],
      message: json['message'],
    );
  }
}




