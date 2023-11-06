
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/api/api_constants.dart';
import 'package:movieapp/model/PopularMovie.dart';
import 'package:movieapp/model/RealaseMovie.dart';
import 'package:movieapp/model/RecomendedMovie.dart';

class ApiManager{


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