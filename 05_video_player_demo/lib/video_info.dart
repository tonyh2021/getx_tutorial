import 'dart:convert';
import 'dart:math';
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
  List _videoInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;

  _initData() async {
    await DefaultAssetBundle.of(context).loadString("json/video_info.json").then((value) {
      setState(() {
        _videoInfo = json.decode(value);
      });
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
          colors: _playArea
              ? [color.AppColor.gradientSecond, color.AppColor.gradientSecond]
              : [
                  color.AppColor.gradientFirst.withOpacity(0.9),
                  color.AppColor.gradientSecond.withOpacity(0.9),
                ],
          begin: const FractionalOffset(0.0, 0.4),
          end: Alignment.topRight,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _playArea
                ? Column(
                    children: [
                      Container(
                        height: 100,
                        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.secondPageTopIconColor,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: color.AppColor.secondPageTopIconColor,
                            )
                          ],
                        ),
                      ),
                      _playView(context),
                      _controlView(context)
                    ],
                  )
                : Container(
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
              decoration: const BoxDecoration(
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(child: _listView())
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  String _convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value?.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = _convertTwo(remained ~/ 60.0);
    final secs = _convertTwo(remained % 60);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
            data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.red[700],
                inactiveTrackColor: Colors.red[100],
                trackShape: const RoundedRectSliderTrackShape(),
                trackHeight: 2.0,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                thumbColor: Colors.redAccent,
                overlayColor: Colors.red.withAlpha(32),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 28),
                tickMarkShape: const RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.red[700],
                inactiveTickMarkColor: Colors.red[100],
                valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.redAccent,
                valueIndicatorTextStyle: const TextStyle(
                  color: Colors.white,
                )),
            child: Slider(
              value: max(0, min(_progress * 100, 100)),
              min: 0,
              max: 100,
              divisions: 100,
              label: _position?.toString().split(".")[0],
              onChanged: (value) async {
                final duration = _controller?.value?.duration;
                if (duration != null) {
                  var newValue = max(0, min(value, 99)) * 0.01;
                  var millis = (duration.inMilliseconds * newValue).toInt();
                  _controller?.seekTo(Duration(milliseconds: millis));
                }
                setState(() {
                  _progress = value * 0.01;
                });
              },
              onChangeStart: (value) {
                _controller?.pause();
              },
              onChangeEnd: (value) {
                final duration = _controller?.value?.duration;
                if (duration != null) {
                  var newValue = max(0, min(value, 99)) * 0.01;
                  var millis = (duration.inMilliseconds * newValue).toInt();
                  _controller?.seekTo(Duration(milliseconds: millis));
                  _controller?.play();
                }
              },
            )),
        Container(
          height: 40,
          margin: const EdgeInsets.only(bottom: 8),
          width: MediaQuery.of(context).size.width,
          color: color.AppColor.gradientSecond,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  if (noMute) {
                    _controller?.setVolume(0);
                  } else {
                    _controller?.setVolume(1);
                  }
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 0.0),
                        blurRadius: 4.0,
                        color: Color.fromARGB(50, 0, 0, 0),
                      )
                    ]),
                    child: Icon(
                      noMute ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (_isPlayingIndex > 1) {
                    int index = _isPlayingIndex - 1;
                    if (_videoInfo.isNotEmpty) {
                      _initializeVideo(index);
                    }
                  } else {
                    Get.snackbar("Video", "",
                        snackPosition: SnackPosition.BOTTOM,
                        icon: const Icon(
                          Icons.face,
                          size: 30,
                          color: Colors.white,
                        ),
                        backgroundColor: color.AppColor.gradientSecond,
                        colorText: Colors.white,
                        messageText: const Text(
                          "No more videos ahead!",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ));
                  }
                },
                child: const Icon(
                  Icons.fast_rewind,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (_isPlaying) {
                    _controller?.pause();
                  } else {
                    _controller?.play();
                  }
                },
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (_isPlayingIndex < _videoInfo.length - 1) {
                    int index = _isPlayingIndex + 1;
                    if (_videoInfo.isNotEmpty) {
                      _initializeVideo(index);
                    }
                  } else {
                    Get.snackbar("Video", "",
                        snackPosition: SnackPosition.BOTTOM,
                        icon: const Icon(
                          Icons.face,
                          size: 30,
                          color: Colors.white,
                        ),
                        backgroundColor: color.AppColor.gradientSecond,
                        colorText: Colors.white,
                        messageText: const Text(
                          "No more video to play.",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ));
                  }
                },
                child: const Icon(
                  Icons.fast_forward,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "$mins:$secs",
                  style: const TextStyle(color: Colors.white, shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(150, 0, 0, 0),
                    )
                  ]),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _playView(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: _controller != null && _controller!.value.isInitialized
          ? VideoPlayer(_controller!)
          : const Center(
              child: Text(
                "Initialing...",
                style: TextStyle(fontSize: 20, color: Colors.white60),
              ),
            ),
    );
  }

  int _onUpdateControllerTime = -1;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;

  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }

    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;

    if (_controller == null) {
      return;
    }
    final controller = _controller!;
    if (!controller.value.isInitialized) {
      debugPrint("Controller can not be initialized");
      return;
    }

    _duration ??= _controller?.value.duration;

    var duration = _duration;
    if (duration == null) {
      return;
    }

    var position = await controller.position;
    _position = position;

    final isPlaying = controller.value.isPlaying;
    if (isPlaying) {
      if (_disposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() / duration.inMilliseconds.ceilToDouble();
      });
    }
    setState(() {
      _isPlaying = isPlaying;
    });
  }

  _onTapVideo(int index) {
    _initializeVideo(index);
  }

  _initializeVideo(int index) {
    final controller = VideoPlayerController.network(_videoInfo[index]["videoUrl"]);
    final old = _controller;
    _controller = controller;

    old?.removeListener(_onControllerUpdate);
    old?.pause();

    setState(() {});
    controller.initialize().then((value) {
      old?.dispose();
      _isPlayingIndex = index;
      controller.addListener(_onControllerUpdate);
      controller.play();
      setState(() {});
    });
  }

  _listView() {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
            itemCount: _videoInfo.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  _onTapVideo(index);
                  setState(() {
                    if (!_playArea) {
                      _playArea = true;
                    }
                  });
                },
                child: _buildCard(index),
              );
            }));
  }

  _buildCard(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      height: 135,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage(_videoInfo[index]["thumbnail"]), fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _videoInfo[index]["title"],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      _videoInfo[index]["time"],
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                  width: 80,
                  height: 20,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xffeaeefc)),
                  child: const Center(
                    child: Text(
                      "15s rest",
                      style: TextStyle(color: Color(0xff839fed)),
                    ),
                  )),
              Row(
                children: [
                  for (int i = 0; i < 70; i++)
                    Container(
                      width: 3,
                      height: 1,
                      decoration: BoxDecoration(
                          color: i % 2 == 0 ? const Color(0xff839fed) : Colors.transparent,
                          borderRadius: BorderRadius.circular(2)),
                    )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
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
