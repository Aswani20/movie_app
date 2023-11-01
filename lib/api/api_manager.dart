import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/api/api_constants.dart';
import 'package:movieapp/model/CategoryResponse.dart';
class ApiManager{
  // https://api.themoviedb.org/3/genre/movie/list?api_key=8751339cf9363a9c9ae208d4d2ac0a7e
  static Future<CategoryResponse> getCategory() async {
    Uri url = Uri.https(ApiConstants.serverName, ApiConstants.categoryApi,
        {'api_key': '8751339cf9363a9c9ae208d4d2ac0a7e',
        }
    );

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoryResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}