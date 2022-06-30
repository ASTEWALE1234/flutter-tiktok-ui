import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_demo/mock/_mock.dart';
import 'package:test_demo/model/user.dart';
import 'package:test_demo/model/video.dart';

class HomeSideIcons extends StatefulWidget {
  final Video video;
  const HomeSideIcons({Key? key, required this.video}) : super(key: key);

  @override
  State<HomeSideIcons> createState() => _HomeSideIconsState();
}

class _HomeSideIconsState extends State<HomeSideIcons>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animationController.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 13, color: Colors.white);
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _profilImageButton(widget.video.postedBy.profileImageUrl),
          _sideBarIcons(
              Icons.heart_broken_rounded, widget.video.likes, 40, style),
          _sideBarIcons(
              Icons.insert_comment_rounded, widget.video.comments, 40, style),
          _sideBarIcons(Icons.mobile_screen_share_outlined, "share", 40, style),
          AnimatedBuilder(
            animation: _animationController,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.amber,
                      image: const DecorationImage(
                          image: AssetImage('assets/bird.jpg'),
                          fit: BoxFit.cover)),
                ),
                const CircleAvatar(
                  radius: 8,
                  backgroundImage: AssetImage('assets/disk.jpg'),
                )
              ],
            ),
            builder: (context, child) {
              return Transform.rotate(
                angle: 2 * pi * _animationController.value,
                child: child,
              );
            },
          )
        ],
      ),
    );
  }

  _profilImageButton(String imageUrl) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(25),
            // ignore: prefer_const_constructors
            image:
                DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        Positioned(
            bottom: -10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.red,
              ),
              child: Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
            ))
      ],
    );
  }

  _sideBarIcons(IconData icon, String label, double size, TextStyle style) {
    return Column(
      children: [
        Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
        Text(
          label,
          style: style,
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
