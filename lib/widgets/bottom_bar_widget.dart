import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/save_screen.dart';
import '../screens/setting_screen.dart';
import '../values/app_styles.dart';

class BottomBar extends StatefulWidget {
  const BottomBar();
  static const routeName = '/bottom-bar';
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  List<Widget> listScreen = [
    HomeScreen(),
    SaveScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: listScreen[_selectedIndex],

      // Bottom bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Colors.black12,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300],
            hoverColor: Colors.grey[100],
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Color(0xFF64FFDA),
            color: Colors.black,
            tabs: [
              GButton(
                backgroundColor: Colors.grey.withOpacity(0.3),
                icon: LineIcons.home,
                text: 'HOME',
                textStyle: AppStyle.tabbar,
              ),
              GButton(
                backgroundColor: Colors.grey.withOpacity(0.3),
                icon: LineIcons.heart,
                text: 'FAVORITE',
                textStyle: AppStyle.tabbar,
              ),
              GButton(
                backgroundColor: Colors.grey.withOpacity(0.3),
                icon: LineIcons.clock,
                text: 'HISTORY',
                textStyle: AppStyle.tabbar,
              ),
              GButton(
                backgroundColor: Colors.grey.withOpacity(0.3),
                icon: LineIcons.user,
                text: 'PROFILE',
                textStyle: AppStyle.tabbar,
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),

      // floatingActionButton: (_selectedIndex == 0)
      //     ? FloatingActionButton(
      //         child: Icon(Icons.add),
      //         onPressed: () {},
      //       )
      //     : null,
    );
  }
}