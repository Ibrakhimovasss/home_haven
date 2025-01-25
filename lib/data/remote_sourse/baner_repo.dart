import 'dart:convert';

import 'package:home_haven/common/network_constants.dart';
import 'package:home_haven/data/models/banner_model.dart';
import 'package:http/http.dart' as http;

class BannerRepo {
  Future<BannerModel> getBannerData() async {
    final url = Uri.parse("${NetworkConstants.baseUrl}/bannner");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        BannerModel banner = BannerModel.fromJson(jsonDecode(response.body));
        return banner;
      } else {
        throw Exception("Error ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
