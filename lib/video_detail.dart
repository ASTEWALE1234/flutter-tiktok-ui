import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:test_demo/model/video.dart';

class VideoDetail extends StatelessWidget {
  const VideoDetail({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "@${video.postedBy.userName}",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          ExpandableText(
            video.caption,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 13, color: Colors.white),
            expandText: "more",
            collapseText: "less",
            collapseOnTextTap: true,
            expandOnTextTap: true,
            maxLines: 2,
            linkColor: Colors.grey,
          ),
          Row(
            children: [
              Icon(
                Icons.music_note_rounded,
                size: 20,
                color: Colors.white,
              ),
              Container(
                height: 25,
                width: MediaQuery.of(context).size.width / 2,
                child: Marquee(
                  text: "${video.audioName}  *  ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 13, color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
