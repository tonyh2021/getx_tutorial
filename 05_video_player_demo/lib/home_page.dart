import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/video_info.dart';
import 'package:video_player_demo/colors.dart' as ColorConfig;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
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
      backgroundColor: ColorConfig.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Training',
                  style:
                      TextStyle(fontSize: 30, color: ColorConfig.AppColor.homePageTitle, fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: ColorConfig.AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: ColorConfig.AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: ColorConfig.AppColor.homePageIcons,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  'Your program',
                  style: TextStyle(
                      fontSize: 20, color: ColorConfig.AppColor.homePageSubtitle, fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                Text(
                  'Details',
                  style: TextStyle(fontSize: 20, color: ColorConfig.AppColor.homePageDetail),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: ColorConfig.AppColor.homePageDetail,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    ColorConfig.AppColor.gradientFirst.withOpacity(0.8),
                    ColorConfig.AppColor.gradientSecond.withOpacity(0.9)
                  ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(80)),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(5, 10),
                        blurRadius: 20,
                        color: ColorConfig.AppColor.gradientSecond.withOpacity(0.2))
                  ]),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next workout',
                      style: TextStyle(fontSize: 16, color: ColorConfig.AppColor.homePageContainerTextSmall),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Leg Toning',
                      style: TextStyle(fontSize: 25, color: ColorConfig.AppColor.homePageContainerTextSmall),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'and Glutes Workout',
                      style: TextStyle(fontSize: 25, color: ColorConfig.AppColor.homePageContainerTextSmall),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 20,
                              color: ColorConfig.AppColor.homePageContainerTextSmall,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '60 min',
                              style: TextStyle(fontSize: 14, color: ColorConfig.AppColor.homePageContainerTextSmall),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60), boxShadow: [
                            BoxShadow(
                                color: ColorConfig.AppColor.gradientFirst, blurRadius: 10, offset: const Offset(4, 8))
                          ]),
                          child: const Icon(
                            Icons.play_circle_fill,
                            size: 60,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(image: AssetImage("assets/card.jpg"), fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 40,
                              offset: const Offset(8, 10),
                              color: ColorConfig.AppColor.gradientSecond.withOpacity(0.3)),
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(-1, -5),
                              color: ColorConfig.AppColor.gradientSecond.withOpacity(0.3))
                        ]),
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    margin: const EdgeInsets.only(left: 20, top: 10),
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/figure.png")),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(left: 140, top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You are doing great',
                          style: TextStyle(
                              fontSize: 18, color: ColorConfig.AppColor.homePageDetail, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Keep it up\n",
                                style: TextStyle(fontSize: 16, color: ColorConfig.AppColor.homePagePlanColor),
                                children: const [TextSpan(text: "stick to your plan")]))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Area of focus',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 25, color: ColorConfig.AppColor.homePageTitle, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Expanded(
                child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                        itemCount: (_info.length.toDouble() / 2).ceil(),
                        itemBuilder: (_, i) {
                          var width = (MediaQuery.of(context).size.width - 90) / 2;
                          return Row(
                            children: [
                              Container(
                                height: 170,
                                width: width,
                                margin: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
                                padding: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(5, 5),
                                      color: ColorConfig.AppColor.gradientSecond.withOpacity(0.1),
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(-5, -5),
                                      color: ColorConfig.AppColor.gradientSecond.withOpacity(0.1),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(image: AssetImage(_info[2 * i]['img'])),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    _info[2 * i]['title'],
                                    style: TextStyle(fontSize: 20, color: ColorConfig.AppColor.homePageDetail),
                                  ),
                                ),
                              ),
                              if (2 * i + 1 < _info.length)
                                Container(
                                  height: 170,
                                  width: width,
                                  margin: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
                                  padding: const EdgeInsets.only(bottom: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        offset: const Offset(5, 5),
                                        color: ColorConfig.AppColor.gradientSecond.withOpacity(0.1),
                                      ),
                                      BoxShadow(
                                        blurRadius: 3,
                                        offset: const Offset(-5, -5),
                                        color: ColorConfig.AppColor.gradientSecond.withOpacity(0.1),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(image: AssetImage(_info[2 * i + 1]['img'])),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      _info[2 * i + 1]['title'],
                                      style: TextStyle(fontSize: 20, color: ColorConfig.AppColor.homePageDetail),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        }),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class Info {
  String? title;
  String? img;

  Info({
    this.title,
    this.img,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        title: json["title"],
        img: json["img"],
      );
}
