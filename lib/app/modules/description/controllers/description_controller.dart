import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mac_task/app/data/utils/image_utils.dart';

class DescriptionController extends GetxController {
  final topTrendingList = <String>[].obs;

  PageController pageController =
      PageController(viewportFraction: 1.0, initialPage: 0);

  final activePage = 0.obs;

  @override
  void onInit() {
    topTrendingList.value = [
      POPULAR_MEETUP5,
      POPULAR_MEETUP3,
      POPULAR_MEETUP4,
      POPULAR_MEETUP2,
      POPULAR_MEETUP1
    ];
    super.onInit();
  }
}
