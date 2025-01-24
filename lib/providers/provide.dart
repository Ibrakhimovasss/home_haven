import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_haven/data/models/furniture_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FurnitureRepo {
  static const String _baseUrl = "https://e-commerce.birnima.uz/api";

  static Future<List<dynamic>> getFurnitures() async {
    final url = Uri.parse("$_baseUrl/products");
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        log(response.body);
        final payload = jsonDecode(response.body)["data"];

        return payload;
      } else {
        throw Exception("Failed to load furniture");
      }
    } catch (e) {
      throw Exception("Error fetching furniture");
    }
  }

  static Future<Map<String, dynamic>> logIn(
      String phoneNumber, String password) async {
    final url = Uri.parse("$_baseUrl/auth/signin");
    final data = {
      "auth_method": "phone-number",
      "password": password,
      "phone_number": phoneNumber,
      "email": ""
    };
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );
      if (response.statusCode == 201) {
        final payload = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", payload["data"]["access_token"]);
        return payload;
      } else {
        throw Exception("Failed to log in");
      }
    } catch (e) {
      throw Exception("Error logging in");
    }
  }

  static Future<Map<String, dynamic>> signUp(
      String email, String password) async {
    final url = Uri.parse("$_baseUrl/auth/signup");
    final data = {
      "phone_number": "",
      "email": email,
      "auth_method": "email",
      "password": password
    };
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );
      if (response.statusCode == 201) {
        final payload = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", payload["data"]["access_token"]);
        log(response.body);
        return payload;
      } else {
        throw Exception("Failed to sign up");
      }
    } catch (e) {
      throw Exception("Error signing up");
    }
  }
}

class FurnitureProvider extends ChangeNotifier {
  List<FurnitureData> _furnitureList = [];
  bool _isLoading = false;

  List<FurnitureData> get furnitureList => _furnitureList;
  bool get isLoading => _isLoading;

  Future<void> fetchFurnitureList() async {
    _isLoading = true;
    notifyListeners();
    try {
      final furs = await FurnitureRepo.getFurnitures();
      _furnitureList = furs
          .map(
            (e) => FurnitureData.fromJson(e),
          )
          .toList();
      log("furnitures: $_furnitureList");
    } catch (e) {
      log("Error fetching furniture list: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> logIn(String phoneNumber, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await FurnitureRepo.logIn(phoneNumber, password);
      log("User logged in: ${response['data']}");
      return true;
    } catch (e) {
      log("Error logging in: $e");
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await FurnitureRepo.signUp(
        email,
        password,
      );
      log("User signed up: ${response['data']}");
    } catch (e) {
      log("Error signing up: $e");
    }
  }
}
