import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_demo/colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List _info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString("json/video_info.json").then((value) {
      _info = json.decode(value);
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            color.AppColor.gradientFirst.withOpacity(0.9),
            color.AppColor.gradientSecond.withOpacity(0.9),
          ],
          begin: const FractionalOffset(0.0, 0.4),
          end: Alignment.topRight,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 30),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: color.AppColor.secondPageIconColor,
                        ),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: color.AppColor.secondPageIconColor,
                      )
                    ],
                  ),
                  Text(
                    'Legs Toning',
                    style: TextStyle(fontSize: 25, color: color.AppColor.secondPageTitleColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'and Glutes Workout',
                    style: TextStyle(fontSize: 25, color: color.AppColor.secondPageTitleColor),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              color.AppColor.secondPageContainerGradient1stColor,
                              color.AppColor.secondPageContainerGradient2ndColor
                            ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '68 min',
                              style: TextStyle(fontSize: 16, color: color.AppColor.secondPageTitleColor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    color.AppColor.secondPageContainerGradient1stColor,
                                    color.AppColor.secondPageContainerGradient2ndColor
                                  ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: Text(
                                    'Resistant band, kettle bell',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 16, color: color.AppColor.secondPageTitleColor),
                                  )),
                                ],
                              ))),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Circuit 1: Legs Toning',
                        style:
                            TextStyle(fontSize: 20, color: color.AppColor.circuitsColor, fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Icon(
                            Icons.loop,
                            size: 30,
                            color: color.AppColor.loopColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '3 sets',
                            style: TextStyle(fontSize: 15, color: color.AppColor.setsColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class Video {
  String? title;
  String? time;
  String? thumbnail;
  String? videoUrl;

  Video({
    this.title,
    this.time,
    this.thumbnail,
    this.videoUrl,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        title: json["title"],
        time: json["time"],
        thumbnail: json["thumbnail"],
        videoUrl: json["videoUrl"],
      );
}
