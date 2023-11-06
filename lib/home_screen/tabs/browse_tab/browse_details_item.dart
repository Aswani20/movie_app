import 'package:flutter/material.dart';
import 'package:movieapp/model/CategoryDetailsResponse.dart';

class BrowseDetailsItem extends StatelessWidget {
  Results results;
  BrowseDetailsItem({super.key,required this.results});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/action.jpg',width: double.infinity,height: double.infinity, fit: BoxFit.cover,),
        Column(
          children: [
            Text(results.title ?? ''),
            Text(results.releaseDate ?? ''),
            Text('${results.popularity}'),
            Text('${results.voteAverage}'),
            Text('${results.voteCount}')
          ],
        ),
      ],
    );
  }
}
