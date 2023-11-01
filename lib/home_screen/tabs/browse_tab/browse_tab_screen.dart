import 'package:flutter/material.dart';
import 'package:movieapp/home_screen/tabs/browse_tab/browse_fragment.dart';

class BrowseTabScreen extends StatelessWidget {
  const BrowseTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BrowseFragment(),
    );
  }
}
