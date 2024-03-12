import 'dart:convert';

import 'package:facebookclone/Models/newsmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<NewsModel?> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(
          "https://saurav.tech/NewsAPI/top-headlines/category/health/in.json"));
      if (response.statusCode == 200) {
        return NewsModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }
}
