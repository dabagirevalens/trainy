import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/screens/home_page.dart';

import 'package:training/utils/colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videos = [];

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        videos = json.decode(value);
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const FractionalOffset(.0, .4),
            end: Alignment.topRight,
            colors: [
              color.AppColors.gradientFirst.withOpacity(.9),
              color.AppColors.gradientSecond,
            ],
          ),
        ),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
            width: MediaQuery.of(context).size.width,
            height: 250,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: color.AppColors.secondPageTopIconColor,
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.info_outline,
                    size: 20,
                    color: color.AppColors.secondPageTopIconColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Legs Toning",
                style: TextStyle(
                    fontSize: 25, color: color.AppColors.secondPageTitleColor),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "and Glutes workout",
                style: TextStyle(
                    fontSize: 25, color: color.AppColors.secondPageTitleColor),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              color.AppColors
                                  .secondPageContainerGradient1stColor,
                              color
                                  .AppColors.secondPageContainerGradient2ndColor
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            size: 20,
                            color: color.AppColors.secondPageIconColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "68 min",
                            style: TextStyle(
                                color: color.AppColors.secondPageTitleColor),
                          )
                        ]),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 250,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              color.AppColors
                                  .secondPageContainerGradient1stColor,
                              color
                                  .AppColors.secondPageContainerGradient2ndColor
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.handyman_outlined,
                            size: 20,
                            color: color.AppColors.secondPageIconColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Resistent band, kettebell",
                            style: TextStyle(
                                color: color.AppColors.secondPageTitleColor),
                          )
                        ]),
                  )
                ],
              )
            ]),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
              child: Column(children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        "Circuit 1: Toning legs",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color.AppColors.circuitsColor),
                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Icon(
                          Icons.loop,
                          color: color.AppColors.loopColor,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "3 sets",
                          style: TextStyle(
                              color: color.AppColors.setsColor, fontSize: 15),
                        )
                      ],
                    )
                  ],
                ),
                Expanded(child: _listView())
              ]),
            ),
          )
        ]),
      ),
    );
  }

  _listView() {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (_, int i) {
        return GestureDetector(
            onTap: () {
              debugPrint("$i");
            },
            child: _buildCard(i));
      },
    );
  }

  _buildCard(int i) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
                    image: DecorationImage(
                        image: AssetImage(videos[i]["thumbnail"]),
                        fit: BoxFit.fill)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      videos[i]["title"],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Text(
                        videos[i]["time"],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    )
                  ])
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                  width: 80,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0XFFeaeefc),
                  ),
                  child: const Center(
                      child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "15s rest",
                      style: TextStyle(color: Color(0XFF839fed)),
                    ),
                  ))),
              Row(
                children: [
                  for (int i = 0; i <= 75; i++)
                    i.isEven
                        ? Container(
                            height: 2,
                            width: 4,
                            decoration: BoxDecoration(
                                color: const Color(0XFF839fed),
                                borderRadius: BorderRadius.circular(10)),
                          )
                        : const SizedBox(
                            height: 2,
                            width: 4,
                          ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
