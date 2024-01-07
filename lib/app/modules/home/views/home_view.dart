import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mac_task/app/common_views/input_field.dart';
import 'package:mac_task/app/common_views/local_asset_image.dart';
import 'package:mac_task/app/data/utils/color_utils.dart';
import 'package:mac_task/app/data/utils/constant_utils.dart';
import 'package:mac_task/app/data/utils/string_utils.dart';
import 'package:mac_task/app/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
import 'package:mac_task/app/modules/description/views/description_view.dart';
import 'package:mac_task/app/routes/app_pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put<HomeController>(HomeController());
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: BLACK,
          ),
          onTap: () => Get.back(),
        ),
        title: const Text(INDIVIDUAL_MEETUP),
        centerTitle: false,
      ),
      body: Center(child: _mainChild(context: context)),
    );
  }

  Widget _mainChild({required BuildContext context}) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            DIVIDER,
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CROSS_AXIS_START,
                children: [
                  SPACING_SMALL_HEIGHT,
                  _searchBox(context: context),
                  SPACING_SMALL_HEIGHT,
                  _individualMeetupContainer(context: context),
                  SPACING_SMALL_HEIGHT,
                  Text(
                    TRENDING_POPULAR_PEOPLE,
                    style: h4_dark(context)?.copyWith(color: BLACK),
                  ),
                  SPACING_VSMALL_HEIGHT,
                  _popularPeopleContainer(context: context),
                  // SPACING_VSMALL_HEIGHT,
                  Text(
                    TOP_TRENDING_MEETUPS,
                    style: h4_dark(context)?.copyWith(color: BLACK),
                  ),
                  SPACING_VSMALL_HEIGHT,
                  _trendingMeetups(context: context)
                ],
              ),
            ),
          ],
        ),
      );

  Widget _searchBox({required BuildContext context}) => InputField(
      textEditingController: controller.searchTextController,
      prefixIcon: const Icon(Icons.youtube_searched_for_sharp),
      suffixIcon: const Icon(Icons.mic),
      focusNode: controller.searchFocusNode,
      borderSide: const BorderSide(width: 0.8, color: DARK_BLUE),
      hintText: SEARCH);

  Widget _individualMeetupContainer({
    required BuildContext context,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                  itemCount: controller.meetupIndiaImg.length,
                  controller: controller.pageController,
                  onPageChanged: (page) {
                    controller.activePage.value = page;
                  },
                  pageSnapping: true,
                  itemBuilder: (context, index) => ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: LocalAssetImage(
                          assetPath: controller.meetupIndiaImg[index],
                          height: 150,
                          width: DEVICE_WIDTH,
                          boxFit: BoxFit.cover,
                        ),
                      )),
              Positioned(
                left: 15,
                bottom: 15,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0, right: 14.0),
                  child: Text(
                    POPULAR_MEETUP_IN,
                    style: h3_dark(context)?.copyWith(
                        // fontSize: 10,
                        color: WHITE,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SmoothPageIndicator(
            controller: controller.pageController,
            count: controller.meetupIndiaImg.length,
            effect: const WormEffect(
                dotWidth: 8,
                dotHeight: 8,
                dotColor: APP_LIGHT_GREY_INPUT_FIELD,
                activeDotColor: DARK_BLUE),
          ),
        ),
      ],
    );
  }

  Widget _popularPeopleContainer({required BuildContext context}) => SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.cardList.length,
          itemBuilder: (context, i) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CROSS_AXIS_START,
              children: [
                Container(
                  width: DEVICE_WIDTH - 100,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: APP_LIGHT_GREY_INPUT_FIELD)),
                  child: Column(
                    mainAxisSize: MIN,
                    children: [
                      SizedBox(
                        width: DEVICE_WIDTH,
                        height: 60,
                        child: ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(color: DARK_BLUE),
                            ),
                            child: const Icon(
                              Icons.settings_accessibility_rounded,
                              color: DARK_BLUE,
                            ),
                          ),
                          title: Text(
                            controller.cardList[i].name,
                            style: h4_dark(context)?.copyWith(color: DARK_BLUE),
                          ),
                          subtitle: Text(
                            '${controller.cardList[i].counts} $MEETUPS',
                            style: h4_dark(context)?.copyWith(fontSize: 11),
                          ),
                        ),
                      ),
                      DIVIDER,
                      SizedBox(
                        height: 50,
                        width: DEVICE_WIDTH,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.cardList[i].image.length,
                            itemBuilder: (context, j) => Align(
                                  widthFactor: 0.8,
                                  child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          controller.cardList[i].image[j])),
                                )),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          height: 30,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: BLUE,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              onPressed: () {},
                              child: Text(
                                SEE_MORE,
                                style: h4_dark(context)?.copyWith(color: WHITE),
                              )),
                        ),
                      ),
                      SPACING_VSMALL_HEIGHT,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  Widget _trendingMeetups({required BuildContext context}) => SizedBox(
        height: 200,
        width: DEVICE_WIDTH,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.topTrendingList.length,
            itemBuilder: (context, i) => GestureDetector(
                  onTap: () {
                    Get.put(BottomNavBarController()).isDescription.value =
                        true;
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: LocalAssetImage(
                        assetPath: controller.topTrendingList[i],
                        height: 200,
                        width: DEVICE_WIDTH / 2.5,
                        boxFit: BoxFit.cover,
                      ),
                    ),
                  ),
                )),
      );
}
