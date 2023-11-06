import 'package:flutter/material.dart';
import 'package:movieapp/api/api_manager.dart';
import 'package:movieapp/home_screen/tabs/home_tab/head/head_container.dart';
import 'package:movieapp/model/PopularMovie.dart';
import 'package:movieapp/my_theme.dart';

class HeadContainerDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopularMovie>(
      future: ApiManager.getPopular(),
      builder:(context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(
            color: MyTheme.goldColor,
          ),);
        }else if(snapshot.hasError){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data?.statusMessage??""),
                ElevatedButton(onPressed: (){}, child: Text("Try Again")),
              ],
            ),
          );
        }
        var headMovieList=snapshot.data?.results??[];
        return ListView(
            scrollDirection: Axis.horizontal,
            children:
            headMovieList.map((movie) => HeadContainer(
            headMovie: movie
        )).toList());

      },
    );
  }
}
