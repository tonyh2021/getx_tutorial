import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentContest extends StatefulWidget {
  const RecentContest({Key? key}) : super(key: key);

  @override
  State<RecentContest> createState() => _RecentContestState();
}

class _RecentContestState extends State<RecentContest> {
  List<dynamic> _info = [];

  _loadData() async {
    final asset = DefaultAssetBundle.of(context);
    final detail = await asset.loadString("json/detail.json");
    setState(() {
      _info = json.decode(detail);
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF69c5df),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: const Color(0xFFcbe6f6),
      body: Container(
        margin: const EdgeInsets.only(left: 20, top: 20, right: 10),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < _info.length; i++)
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      height: 240,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed("/detail", arguments: {
                            "title": _info[i]['title'].toString(),
                            "text": _info[i]['text'].toString(),
                            "name": _info[i]['name'].toString(),
                            "img": _info[i]['img'].toString(),
                            "time": _info[i]['time'].toString(),
                            "prize": _info[i]['prize'].toString(),
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          height: 220,
                          width: MediaQuery.of(context).size.width - 20,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: i.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${_info[i]["title"]}",
                                    style:
                                        const TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
                                  ),
                                  Expanded(child: Container())
                                ],
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: width,
                                child: Text(
                                  "${_info[i]["text"]}",
                                  style: const TextStyle(fontSize: 20, color: Color(0xFFb8eefc)),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                thickness: 1.0,
                              ),
                              Row(children: [
                                for (int i = 0; i < 4; i++)
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          image:
                                              DecorationImage(image: AssetImage(_info[i]["img"]), fit: BoxFit.cover)),
                                    ),
                                  )
                              ]),
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
