import 'package:flutter/material.dart';
import 'package:test_demo/add_video_page.dart';
import 'package:test_demo/discovery_page.dart';
import 'package:test_demo/first_home_page.dart';
import 'package:test_demo/home_page.dart';
import 'package:test_demo/inbox_page.dart';
import 'package:test_demo/profile_page.dart';

import 'widgets/custom_bottom_navigation_bar.dart';

class NavigatinContainer extends StatefulWidget {
  const NavigatinContainer({Key? key}) : super(key: key);

  @override
  State<NavigatinContainer> createState() => _NavigatinContainerState();
}

class _NavigatinContainerState extends State<NavigatinContainer> {
  int _selectedPageIndex = 0;
  static const List<Widget> pages = [
    FirstHomePage(),
    AddVideoPage(),
    DiscoveryPage(),
    InboxPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[_selectedPageIndex],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          selectedPageIndex: _selectedPageIndex, onTap: _onTap),
    );
  }

  _onTap(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}
