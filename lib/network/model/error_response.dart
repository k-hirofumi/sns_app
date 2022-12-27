class ErrorResponse {
  ErrorResponse({
    required this.code,
    required this.message,
    this.content,
  });
  
  final int code;
  final String message;
  final String? content;

  static ErrorResponse fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      code: json['code'],
      message: json['message'],
      content: json['content'],
    );
  }
}




