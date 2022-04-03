import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/screens/video_info.dart';

import 'package:training/utils/colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("json/info.json")
        .then((value) => {info = json.decode(value)});
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColors.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                      fontSize: 30,
                      color: color.AppColors.homePageTitle,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: color.AppColors.homePageIcons,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: color.AppColors.homePageIcons,
                ),
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: color.AppColors.homePageIcons,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Your program",
                  style: TextStyle(
                      fontSize: 20,
                      color: color.AppColors.homePageSubTitle,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColors.homePageDetail,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                InkWell(
                  onTap: () => Get.to(() => const VideoInfo()),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 25,
                    color: color.AppColors.homePageIcons,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      color.AppColors.gradientFirst.withOpacity(.8),
                      color.AppColors.gradientSecond.withOpacity(.9),
                    ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(80),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(10, 10),
                          blurRadius: 10,
                          color: color.AppColors.gradientSecond.withOpacity(.3))
                    ]),
                child: Container(
                  padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Next Workout",
                        style: TextStyle(
                            fontSize: 16,
                            color: color.AppColors.homePageContainerTextSmall),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Legs Toning",
                        style: TextStyle(
                            fontSize: 25,
                            color: color.AppColors.homePageContainerTextSmall),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "and Glutes workout",
                        style: TextStyle(
                            fontSize: 25,
                            color: color.AppColors.homePageContainerTextSmall),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.timer,
                                size: 20,
                                color:
                                    color.AppColors.homePageContainerTextSmall,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "60 min",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: color
                                        .AppColors.homePageContainerTextSmall),
                              )
                            ],
                          ),
                          Expanded(child: Container()),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(4, 8),
                                    blurRadius: 10,
                                    color: color.AppColors.gradientFirst)
                              ],
                              borderRadius: BorderRadius.circular(50),
                            ),
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
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    margin: const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(8, 10),
                              blurRadius: 40,
                              color: color.AppColors.gradientSecond
                                  .withOpacity(.3)),
                          BoxShadow(
                              offset: const Offset(-1, -5),
                              blurRadius: 40,
                              color: color.AppColors.gradientSecond
                                  .withOpacity(.3))
                        ],
                        image: const DecorationImage(
                          image: AssetImage("assets/card.jpg"),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    margin: const EdgeInsets.only(
                      right: 250,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage("assets/figure.png"),
                        )),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(left: 150, top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You are doing great",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: color.AppColors.homePageDetail),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "keep it up\n",
                                style: TextStyle(
                                    color: color.AppColors.homePagePlanColor,
                                    fontSize: 18),
                                children: const [
                              TextSpan(text: "stick to your plan")
                            ]))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Areas of Focus',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: color.AppColors.homePageTitle),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: info.length.toDouble() ~/ 2,
                      itemBuilder: (_, i) {
                        int a = 2 * i;
                        int b = 2 * i + 1;
                        return (Row(
                          children: [
                            Container(
                              height: 180,
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              margin:
                                  const EdgeInsets.only(left: 30, bottom: 30),
                              padding: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(info[a]["img"])),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: const Offset(5, 5),
                                        color: color.AppColors.gradientSecond
                                            .withOpacity(.1)),
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: const Offset(-5, -5),
                                        color: color.AppColors.gradientSecond
                                            .withOpacity(.1))
                                  ]),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    info[a]["title"],
                                    style: TextStyle(
                                        color: color.AppColors.homePageDetail,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 180,
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              margin:
                                  const EdgeInsets.only(left: 30, bottom: 30),
                              padding: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(info[b]["img"])),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: const Offset(5, 5),
                                        color: color.AppColors.gradientSecond
                                            .withOpacity(.1)),
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: const Offset(-5, -5),
                                        color: color.AppColors.gradientSecond
                                            .withOpacity(.1))
                                  ]),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    info[b]["title"],
                                    style: TextStyle(
                                        color: color.AppColors.homePageDetail,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ));
                      })),
            )
          ],
        ),
      ),
    );
  }
}
