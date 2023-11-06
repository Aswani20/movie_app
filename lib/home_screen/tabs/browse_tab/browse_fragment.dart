import 'package:flutter/material.dart';
import 'package:movieapp/api/api_manager.dart';
import 'package:movieapp/home_screen/tabs/browse_tab/browse_details.dart';
import 'package:movieapp/home_screen/tabs/browse_tab/browse_item.dart';
import 'package:movieapp/model/browse_data.dart';
import 'package:movieapp/my_theme.dart';

class BrowseFragment extends StatefulWidget {
  BrowseFragment({super.key});

  @override
  State<BrowseFragment> createState() => _BrowseFragmentState();
}

class _BrowseFragmentState extends State<BrowseFragment> {
  var browseList = BrowseData.getBrowse();


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
        FutureBuilder(
            future: ApiManager.getCategory(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: MyTheme.whiteColor,
                    ),
                  ),
                );
              }
              else if (snapshot.hasError) {
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text("Something Went Wrong", style: Theme.of(context).textTheme.titleMedium,),
                        ElevatedButton(
                          onPressed: () {
                            ApiManager.getCategory();
                            setState(() {});
                          },
                          child: Text("Try Again"),
                        )
                      ],
                    ),
                  ),
                );
              }
              if (snapshot.data!.status_code == 7) {
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.data!.status_message ?? ""),
                        ElevatedButton(
                            onPressed: () {
                              ApiManager.getCategory();
                              setState(() {});
                            },
                            child: Text("Try Again")),
                      ],
                    ),
                  ),
                );
              }

              var categoryList = snapshot.data!.genres ?? [];
              return Expanded(
                child: GridView.builder(
                  itemCount: categoryList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 0,
                  ),
                  itemBuilder: (context, index) {
                    final id = categoryList[index].id;
                    final browseData = browseList.firstWhere((browseData) => browseData.id == id,orElse: () => BrowseData(id:0 , title: categoryList[index].name ?? '', imageUrl: 'assets/images/action.jpg'),);
                    return InkWell(
                      onTap: () {
                          Navigator.of(context).pushNamed(BrowseDetails.routeName, arguments: GenersObjectArgs(genresId: categoryList[index].id));
                      },
                      child:
                      BrowseItem(browseData:browseData,genres: categoryList[index]),
                    );
                  },
                ),
              );
            }),
      ],
    );
  }
}

