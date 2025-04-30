import 'dart:convert';

class LoginMainResponse {
  final bool status;
  final String? message;
  final LoginResponse data;
  final String userToken;

  LoginMainResponse({
    this.message,
    required this.status,
    required this.data,
    required this.userToken,
  });

  factory LoginMainResponse.fromJson(Map<String, dynamic> json) =>
      LoginMainResponse(
        status: json['status'],
        message: json['message'],
        data: LoginResponse.fromJson(json['data']),
        userToken: json['userToken'],
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (message != null) 'message': message,
    'data': data.toJson(),
    'userToken': userToken,
  };
}

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final String id;
  final String username;
  final String email;
  final String fcm;
  final bool verification;
  final String phone;
  final bool phoneVerification;
  final String userType;
  final String profile;

  LoginResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.verification,
    required this.phone,
    required this.phoneVerification,
    required this.userType,
    required this.profile,
    required this.fcm,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    id: json['_id'] as String,
    username: json['username'] as String? ?? '',
    email: json['email'] as String? ?? '',
    fcm: json['fcm'] as String? ?? 'none',
    verification: json['verification'] as bool? ?? false,
    phone: json['phone'] as String? ?? '',
    phoneVerification: json['phoneVerification'] as bool? ?? false,
    userType: json['userType'] as String? ?? '',
    profile: json['profile'] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "username": username,
    "email": email,
    'fcm': fcm,
    "verification": verification,
    "phone": phone,
    "phoneVerification": phoneVerification,
    "userType": userType,
    "profile": profile,
  };
}
