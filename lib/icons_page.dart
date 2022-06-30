import 'package:flutter/material.dart';

class IconsPage extends StatefulWidget {
  IconData icon;
  String label;
  Function onTap;

  IconsPage(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  State<IconsPage> createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
