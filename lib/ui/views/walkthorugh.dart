import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sutraq/const/app_list.dart';
import 'package:sutraq/const/app_string.dart';
import 'package:sutraq/ui/views/home_screen.dart';

class WalkThrough extends StatefulWidget {
  const WalkThrough({Key? key}) : super(key: key);

  @override
  State<WalkThrough> createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  final controller = CarouselController();
  int activeIndex = 0;
  int titleIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: AppList.walkthrough_imgList.length,
              itemBuilder: (context, index, realIndex) {
                final img = AppList.walkthrough_imgList[index];
                return buildBuildImage(img, index);
              },
              options: CarouselOptions(
                  height: 400,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  onPageChanged: (index, reason) => setState(() {
                        activeIndex = index;
                        titleIndex = index;
                      })),
              carouselController: controller,
            ),
            SizedBox(
              height: 25,
            ),
            buildIndicator(),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: Color(0xFF62BB46)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  Text(
                    AppList.walkthrough_titleList[titleIndex],
                    style: const TextStyle(
                        fontSize: 27,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Text(
                      AppList.walkthrough_subtitleList[titleIndex],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    height: 55,
                    width: 280,
                    color: Colors.black,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          AppString.walkthrough_login_button_title,
                          style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),
                        )),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: ()=>null,
                          child: Text(AppString.walkthrough_end_title,
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 15,))))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  animateToSlide(int index) => controller.animateToPage(index);

  buildBuildImage(String img, int index) => Container(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Image.asset(
            img,
          ),
        ),
      );
  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: AppList.walkthrough_imgList.length,
      onDotClicked: animateToSlide,
      effect: SlideEffect(
          activeDotColor: Color(0xFF62BB46), dotHeight: 7, dotWidth: 7));
}
