import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:test_demo/home_side_icon.dart';
import 'package:test_demo/mock/_mock.dart';
import 'package:test_demo/video_detail.dart';
import 'package:test_demo/video_tile.dart';

class FirstHomePage extends StatefulWidget {
  const FirstHomePage({Key? key}) : super(key: key);

  @override
  State<FirstHomePage> createState() => _FirstHomePageState();
}

class _FirstHomePageState extends State<FirstHomePage> {
  bool _isFollowingSelected = true;
  int _snapedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFollowingSelected = true;
                    });
                  },
                  child: Text(
                    "Following",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: _isFollowingSelected ? 18 : 15,
                        color:
                            _isFollowingSelected ? Colors.white : Colors.grey),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  " | ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFollowingSelected = false;
                    });
                  },
                  child: Text(
                    " for you",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: !_isFollowingSelected ? 18 : 15,
                        color:
                            !_isFollowingSelected ? Colors.white : Colors.grey),
                  ),
                )
              ],
            )),
        body: PageView.builder(
            onPageChanged: (int page) {
              setState(() {
                _snapedPageIndex = page;
              });
            },
            itemCount: videos.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoTile(
                    video: videos[index],
                    snapedPageIndex: _snapedPageIndex,
                    currentIndex: index,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 3,
                            child: VideoDetail(video: videos[index]),
                          )),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.75,
                          child: HomeSideIcons(
                            video: videos[index],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            }));
  }
}
