import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp/api/api_constants.dart';
import 'package:movieapp/model/CategoryDetailsResponse.dart';
import 'package:movieapp/model/CategoryResponse.dart';
import 'package:movieapp/model/PopularMovie.dart';
import 'package:movieapp/model/RealaseMovie.dart';
import 'package:movieapp/model/RecomendedMovie.dart';
class ApiManager{
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

  static Future<CategoryDetailsResponse> getCategoryDetails(String catId) async {
    Uri url = Uri.https(ApiConstants.serverName, ApiConstants.categoryDetailsApi,
        {
          'api_key': '8751339cf9363a9c9ae208d4d2ac0a7e',
          'with_genres': catId,
        }
    );

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoryDetailsResponse.fromJson(json);
    } catch (e) {
        throw e;
    }
    
    
  static Future<PopularMovie> getPopular()async{
 //https://api.themoviedb.org/3/movie/popular
    try{
      Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.movieApi,{
        'api_key':"0d0b9f56bf8c39c405d4def7fddc1b68",
      });
      var respone=await http.get(url);
      var bodyString=respone.body;
      var json=jsonDecode(bodyString);
      return PopularMovie.fromJson(json);
    }catch(e){
      throw e;
    }


    

  static Future<ReleaseMovie> getReleases()async{
    /*
    //https://api.themoviedb.org/3/movie/upcoming?api_key=0d0b9f56bf8c39c405d4def7fddc1b68
    */
    try{
      Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.releaseApi,{
        'api_key':"0d0b9f56bf8c39c405d4def7fddc1b68",

      });
      var respone= await http.get(url);
      var bodyString=respone.body;
      var json= jsonDecode(bodyString);
      return ReleaseMovie.fromJson(json);
    }catch(e){
      throw e;
    }

  }
      static Future<RecomendedMovie> getRecomended()async{
    /*
    //https://api.themoviedb.org/3/movie/top_rated?api_key=0d0b9f56bf8c39c405d4def7fddc1b68
    */
    try{
      Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.recomendedApi,{
        'api_key':"0d0b9f56bf8c39c405d4def7fddc1b68",

      });
      var respone= await http.get(url);
      var bodyString=respone.body;
      var json= jsonDecode(bodyString);
      return RecomendedMovie.fromJson(json);
    }catch(e){
      throw e;
    }

    }
  }

}