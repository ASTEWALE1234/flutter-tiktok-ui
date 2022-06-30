import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedPageIndex;
  Function onTap;
  CustomBottomNavigationBar(
      {Key? key, required this.selectedPageIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barHeight = MediaQuery.of(context).size.height * 0.06;
    TextStyle style =
        Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14);
    return BottomAppBar(
      color: selectedPageIndex == 0 ? Colors.black : Colors.white,
      child: Container(
        height: barHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomNavBarItem(0, "home", Icons.home_rounded, style),
            _bottomNavBarItem(1, "Discover", Icons.search_rounded, style),
            _addVideoItem(barHeight),
            _bottomNavBarItem(3, "inbox", Icons.inbox_rounded, style),
            _bottomNavBarItem(4, "profile", Icons.person_outline, style)
          ],
        ),
      ),
    );
  }

  _bottomNavBarItem(int index, String label, IconData icon, TextStyle style) {
    bool isSelected = selectedPageIndex == index;
    Color iconAndTextClr = isSelected ? Colors.black : Colors.grey;
    if (isSelected && selectedPageIndex == 0) {
      iconAndTextClr = Colors.white;
    }
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 30,
            color: iconAndTextClr,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            label,
            style: style.copyWith(color: iconAndTextClr),
          )
        ],
      ),
    );
  }

  _addVideoItem(double height) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: height - 15,
      width: 48,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.blueAccent,
        Colors.redAccent,
      ])),
      child: Container(
        height: height - 15,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: selectedPageIndex == 0 ? Colors.white : Colors.black),
        child: Icon(
          Icons.add,
          color: selectedPageIndex == 0 ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
