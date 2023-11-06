import 'package:flutter/material.dart';
import 'package:movieapp/api/api_manager.dart';
import 'package:movieapp/home_screen/tabs/browse_tab/browse_details_item.dart';
import 'package:movieapp/home_screen/tabs/browse_tab/browse_item.dart';
import 'package:movieapp/my_theme.dart';

class BrowseDetails extends StatefulWidget {
  static const String routeName = 'details';
  const BrowseDetails({super.key});

  @override
  State<BrowseDetails> createState() => _BrowseDetailsState();
}

class _BrowseDetailsState extends State<BrowseDetails> {
  @override
  Widget build(BuildContext context) {
    GenersObjectArgs args= ModalRoute.of(context)!.settings.arguments as GenersObjectArgs;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FutureBuilder(
              future: ApiManager.getCategoryDetails(args.genresId.toString()),
              builder: (context, snapshot){
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
                              ApiManager.getCategoryDetails(args.genresId.toString());
                              setState(() {});
                            },
                            child: Text("Try Again"),
                          )
                        ],
                      ),
                    ),
                  );
                }
                if (snapshot.data!.success == false) {
                  return Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(snapshot.data!.status_message ?? ""),
                          ElevatedButton(
                              onPressed: () {
                                ApiManager.getCategoryDetails(args.genresId.toString());
                                setState(() {});
                              },
                              child: Text("Try Again")),
                        ],
                      ),
                    ),
                  );
                }

                var categoryDetailsList = snapshot.data!.results ?? [];
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context,index){
                      return Container(
                        margin:const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1,color: MyTheme.grayColor)
                        ),
                      );
                    },
                    itemCount: categoryDetailsList.length,
                      itemBuilder: (context,index){
                         return BrowseDetailsItem(results: categoryDetailsList[index],);
                      }
                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}
