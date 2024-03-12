import 'package:flutter/material.dart';

import '../Api/api.dart';
import '../Models/news/news_model.dart';

class HomePageNotifier extends ChangeNotifier {
  NewsModel? model;
  final Api _api = Api();
  bool isApiLoading = false;

  void getData() async {
    isApiLoading = true;
    model = await _api.fetchNews();
    isApiLoading = false;
    notifyListeners();
  }
}
