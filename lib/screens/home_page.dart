import 'package:flutter/material.dart';

import 'package:training/utils/colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColors.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
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
              height: 30,
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
                Icon(
                  Icons.arrow_forward,
                  size: 25,
                  color: color.AppColors.homePageIcons,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "next workout",
                    style: TextStyle(
                        fontSize: 16,
                        color: color.AppColors.homePageContainerTextSmall),
                  ),
                  Text(
                    "next workout",
                    style: TextStyle(
                        fontSize: 16,
                        color: color.AppColors.homePageContainerTextSmall),
                  ),
                  Text(
                    "next workout",
                    style: TextStyle(
                        fontSize: 16,
                        color: color.AppColors.homePageContainerTextSmall),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
