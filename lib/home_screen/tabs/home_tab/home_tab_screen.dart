import 'package:flutter/material.dart';
import 'package:movieapp/home_screen/tabs/home_tab/head/head_container_details.dart';
import 'package:movieapp/home_screen/tabs/home_tab/recomended/recomended_container_details.dart';
import 'package:movieapp/home_screen/tabs/home_tab/releases/release_container_details.dart';
import 'package:movieapp/my_theme.dart';

class HomeTabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      body: ListView(
        children: [
          Container(height:MediaQuery.of(context).size.height*0.5,child: HeadContainerDetails()),
          SizedBox(height: 15,),
          Container(height:MediaQuery.of(context).size.height*0.4,child:  ReleaseContainerDetails()),
          SizedBox(height: 15,),
          Container(height:MediaQuery.of(context).size.height*0.4,child:  RecomendedContainerDetails()),
          // ReleaseContainerDetails(),
        ],
      )
    );
  }
}
