import 'package:flutter/material.dart';
import 'package:movieapp/home_screen/tabs/browse_tab/browse_tab_screen.dart';
import 'package:movieapp/home_screen/tabs/home_tab/home_tab_screen.dart';
import 'package:movieapp/home_screen/tabs/search_tab/search_tab_screen.dart';
import 'package:movieapp/home_screen/tabs/wishlist_tab/wishlist_tab_screen.dart';
import 'package:movieapp/my_theme.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      body: tabs[selectedIndex],
      bottomNavigationBar: Theme(
        data:
            Theme.of(context).copyWith(canvasColor: MyTheme.navigationBarColor),
        child: BottomNavigationBar(
        currentIndex: selectedIndex,
          onTap: (index){
          selectedIndex = index;
          setState(() {

          });
          },
          items: [
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/home_icon.png'),
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/search_icon.png'),
                ),
                label:"Search" ),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/browse_icon.png'),
                ),
                label: "Browse"),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/wishlist_icon.png'),
                ),
                label: "Wishlist"),
          ],
        ),
      ),
    );
  }


  List<Widget> tabs = [
    HomeTabScreen(),
    SearchTabScreen(),
    BrowseTabScreen(),
    WishListTabScreen(),
  ];
}
