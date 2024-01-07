import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mac_task/app/data/utils/image_utils.dart';

class HomeController extends GetxController {
  PageController pageController =
      PageController(viewportFraction: 1.0, initialPage: 0);

  final activePage = 0.obs;

  final TextEditingController searchTextController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  final meetupIndiaImg = <String>[].obs;
  final topTrendingList = <String>[].obs;

  final cardList = <CardModel>[].obs;

  @override
  void onInit() {
    meetupIndiaImg.value = [POPULAR_MEETUP3, POPULAR_MEETUP2, POPULAR_MEETUP1];
    topTrendingList.value = [
      POPULAR_MEETUP5,
      POPULAR_MEETUP3,
      POPULAR_MEETUP4,
      POPULAR_MEETUP2,
      POPULAR_MEETUP1
    ];
    cardList.value = [
      CardModel(name: 'Author', counts: '1,028', image: [
        POPULAR_MEETUP3,
        POPULAR_MEETUP2,
        POPULAR_MEETUP1,
        POPULAR_MEETUP3,
        POPULAR_MEETUP1
      ]),
      CardModel(name: 'Priya', counts: '7,028', image: [
        POPULAR_MEETUP3,
        POPULAR_MEETUP2,
        POPULAR_MEETUP1,
        POPULAR_MEETUP3,
        POPULAR_MEETUP1
      ]),
      CardModel(name: 'Admin', counts: '5,050', image: [
        POPULAR_MEETUP3,
        POPULAR_MEETUP2,
        POPULAR_MEETUP1,
        POPULAR_MEETUP3,
        POPULAR_MEETUP1
      ])
    ];
    super.onInit();
  }
}

class CardModel {
  String name;
  String counts;
  List<String> image;

  CardModel({required this.name, required this.counts, required this.image});
}
