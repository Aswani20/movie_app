import 'package:flutter/material.dart';
import 'package:movieapp/home_screen/tabs/browse_tab/browse_item.dart';
import 'package:movieapp/model/browse_data.dart';

class BrowseFragment extends StatelessWidget {
  var browseList = BrowseData.getBrowse();

  BrowseFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Browse Category",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.builder(
              itemCount: browseList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 0,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){},
                  child: BrowseItem(browseData: browseList[index]),
                );
              }),
        ),
      ],
    );
  }
}
