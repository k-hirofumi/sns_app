class UserInfoResponse {
  UserInfoResponse({
    required this.userId,
    required this.name,
    required this.email,
  });
  final String userId;
  final String name;
  final String email;

  static UserInfoResponse fromJson(Map<String, dynamic> json) {
    return UserInfoResponse(
      userId: json['user_id'],
      name: json['name'],
      email: json['email'],
    );
  }
}




