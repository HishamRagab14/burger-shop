// // lib/services/auth_service.dart
// import 'dart:developer';

// import 'package:shared_preferences/shared_preferences.dart';

// class AuthService {
//   static const _authTokenKey = 'auth_token';

//   // Save token after successful login
//   static Future<void> saveToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_authTokenKey, token);
//   }

//   // Retrieve token for authenticated requests
//   static Future<String?> getToken() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       return prefs.getString('auth_token');
//     } catch (e) {
//       log('AuthService Error: $e');
//       return null;
//     }
//   }

//   // Clear token on logout
//   static Future<void> clearToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_authTokenKey);
//   }

//   // Check if user is logged in
//   static Future<bool> isLoggedIn() async {
//     return (await getToken()) != null;
//   }
// }