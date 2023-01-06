class NoDataResponse {
  NoDataResponse({
    required this.result,
  });
  final bool result;

  static NoDataResponse fromJson(Map<String, dynamic> json) {
    return NoDataResponse(
      result: json['result'],
    );
  }
}




