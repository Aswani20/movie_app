import 'package:flutter/material.dart';
import 'package:movieapp/api/api_manager.dart';
import 'package:movieapp/home_screen/tabs/home_tab/releases/release_container.dart';
import 'package:movieapp/model/RealaseMovie.dart';
import 'package:movieapp/my_theme.dart';

class ReleaseContainerDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ReleaseMovie>(
      future: ApiManager.getReleases(),
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
        var releaseMovieList=snapshot.data?.results??[];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02),
          child:
          Container(
            color: MyTheme.midBlackColor,
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("New Releases ",style: Theme.of(context).textTheme.titleLarge,),
                ),
                Expanded(
                  child: ListView(

                    scrollDirection: Axis.horizontal,
                    children:
                    releaseMovieList.map((movie) => ReleaseContainer(
                        releaseMovie: movie
                    )).toList(),

                  ),
                ),
              ],
            ),
          ),
        );

      },
    );
  }
}
