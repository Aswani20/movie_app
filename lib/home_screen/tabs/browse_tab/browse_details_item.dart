import 'package:flutter/material.dart';
import 'package:movieapp/model/CategoryDetailsResponse.dart';

class BrowseDetailsItem extends StatelessWidget {
  Results results;
  BrowseDetailsItem({super.key,required this.results});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Image.asset('assets/images/action.jpg', height: MediaQuery.of(context).size.height*0.12,width: MediaQuery.of(context).size.width*0.5,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(results.title ?? '',style: Theme.of(context).textTheme.titleMedium,),
                const SizedBox(height: 8,),
                Text(results.releaseDate ?? '',style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(height: 8,),
                Text('${results.voteAverage}',style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(height: 8,),
                Text('${results.voteCount}',style: Theme.of(context).textTheme.titleSmall,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
