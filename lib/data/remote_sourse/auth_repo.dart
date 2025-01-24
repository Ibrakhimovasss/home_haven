// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class FurnitureRepo {
//   static const String _baseUrl = "https://e-commerce.birnima.uz/api";

//   // Tokenni to'g'ridan-to'g'ri saqlash o'rniga keyinchalik secure storage bilan boshqarishni maslahat beraman
//   static const String _token =
//       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjc5MzE0OGNmOTdmMjA5ZTlkY2Y2MDEwIiwiaWF0IjoxNzM3NjkyMzAwfQ.POphmm3BBZ1Mv5ZVOlgpbZiwM1g_7inDa61y9o5qaSY";

//   /// Get furniture list
//   static Future<List<dynamic>> getFurnitures() async {
//     final url = Uri.parse("$_baseUrl/products");
//     try {
//       final response = await http.get(
//         url,
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $_token",
//         },
//       );

//       if (response.statusCode == 200) {
//         log("Furniture list fetched successfully");
//         return jsonDecode(response.body);
//       } else {
//         log("Failed to fetch furniture: ${response.statusCode}");
//         throw Exception("Failed to load furniture");
//       }
//     } catch (e) {
//       log("Error: $e");
//       throw Exception("Error fetching furniture");
//     }
//   }

//   /// Log in user
//   static Future<Map<String, dynamic>> logIn(
//       String phoneNumber, String password) async {
//     final url = Uri.parse("$_baseUrl/auth/signin");
//     final data = {
//       "auth_method": "phone-number",
//       "password": password,
//       "phone_number": phoneNumber,
//       "email": ""
//     };

//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(data),
//       );

//       if (response.statusCode == 201) {
//         log("Login successful");
//         return jsonDecode(response.body);
//       } else {
//         log("Login failed: ${response.statusCode}");
//         throw Exception("Failed to log in");
//       }
//     } catch (e) {
//       log("Error: $e");
//       throw Exception("Error logging in");
//     }
//   }

//   /// Sign up user
//   static Future<Map<String, dynamic>> signUp(
//       String phoneNumber, String password) async {
//     final url = Uri.parse("$_baseUrl/auth/signup");
//     final data = {
//       "auth_method": "phone-number",
//       "password": password,
//       "phone_number": phoneNumber,
//       "email": ""
//     };

//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(data),
//       );

//       if (response.statusCode == 201) {
//         log("Sign up successful");
//         return jsonDecode(response.body);
//       } else {
//         log("Sign up failed: ${response.statusCode}");
//         throw Exception("Failed to sign up");
//       }
//     } catch (e) {
//       log("Error: $e");
//       throw Exception("Error signing up");
//     }
//   }
// }
