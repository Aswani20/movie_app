import 'package:flutter/material.dart';
import 'package:movieapp/api/api_manager.dart';
import 'package:movieapp/home_screen/tabs/browse_tab/browse_details_item.dart';
import 'package:movieapp/home_screen/tabs/browse_tab/browse_item.dart';
import 'package:movieapp/my_theme.dart';

class BrowseDetails extends StatefulWidget {
  static const String routeName = 'details';
  BrowseDetails({super.key});

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
              future: ApiManager.getCategoryDetails(),
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
                              ApiManager.getCategoryDetails();
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
                                ApiManager.getCategoryDetails();
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
                  child: ListView.builder(
                    itemCount: categoryDetailsList.length,
                      itemBuilder: (context,index){
                          BrowseDetailsItem(results: categoryDetailsList[index],);
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
