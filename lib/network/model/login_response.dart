class LoginResponse {
  LoginResponse({
    required this.accessToken,
  });
  final String accessToken;

  static LoginResponse fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['access_token'],
    );
  }
}




