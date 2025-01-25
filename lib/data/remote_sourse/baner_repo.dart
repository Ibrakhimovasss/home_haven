import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BannerRepo {
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
}
