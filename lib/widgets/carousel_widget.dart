import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatefulWidget {
  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  List<Talkshow> listTalkshow = Talkshow.createListTalkshow();
  int activeIndex = 0;

  List<Widget> getListAds(BuildContext context) {
    final double _sizeWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(
        GestureDetector(
          child: Image.network(
            listTalkshow[i].image,
            fit: BoxFit.cover,
            width: _sizeWidth,
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/talkshow-detail-screen',
                arguments: listTalkshow[i]);
          },
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    // return Container(
    //   child: ClipRRect(
    //     // borderRadius: BorderRadius.circular(5),
    //     child: ImageSlideshow(
    //       width: double.infinity,
    //       height: 200,
    //       initialPage: 0,
    //       // indicatorColor: Color(0xFF00CCFF),
    //       indicatorColor: Colors.white,

    //       indicatorBackgroundColor: Colors.grey,
    //       onPageChanged: (value) {
    //         // debugPrint('Page changed: $value');
    //       },
    //       autoPlayInterval: 3000,
    //       isLoop: true,
    //       children: [
    //         ...getListAds(context),
    //       ],
    //     ),
    //   ),
    //   decoration: BoxDecoration(
    //     boxShadow: [
    //       BoxShadow(
    //         // offset: Offset(1.0, 2.0),
    //         blurRadius: 8,
    //         color: Color(0xFF888888),
    //       ),
    //     ],
    //   ),
    // );
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: _sizeHeight * 0.25,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
            itemCount: getListAds(context).length,
            itemBuilder: (context, index, realIndex) {
              return getListAds(context)[index];
            },
          ),
          SizedBox(height: _sizeHeight * 0.02),
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: getListAds(context).length,
            effect: SlideEffect(
              dotHeight: 6,
              dotWidth: 6,
              activeDotColor: Color(0xFFAAAAAA),
              dotColor: Color(0xFFDDDDDD),
            ),
          )
        ],
      ),
    );
  }
}
