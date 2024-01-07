import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:mac_task/app/common_views/local_asset_image.dart';
import 'package:mac_task/app/data/utils/color_utils.dart';
import 'package:mac_task/app/data/utils/constant_utils.dart';
import 'package:mac_task/app/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/description_controller.dart';

class DescriptionView extends GetView<DescriptionController> {
  const DescriptionView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put<DescriptionController>(DescriptionController());
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: BLACK,
          ),
          onTap: () {
            Get.put<BottomNavBarController>(BottomNavBarController())
                .isDescription
                .value = false;
            Get.back();
          },
        ),
        title: const Text('Description'),
        centerTitle: false,
      ),
      body: Center(child: _mainChild(context: context, controller: controller)),
    );
  }

  Widget _mainChild(
          {required BuildContext context,
          required DescriptionController controller}) =>
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CROSS_AXIS_START,
            children: [
              DIVIDER,
              SPACING_SMALL_HEIGHT,
              _imageContainer(context: context),
              SPACING_VSMALL_HEIGHT,
              _ratingBarContainer(context: context),
              SPACING_SMALL_HEIGHT,
              Text(
                'Actor Name',
                style: h4_dark(context)?.copyWith(color: DARK_BLUE),
              ),
              SPACING_VVSMALL_HEIGHT,
              Text(
                'Indian Actress',
                style: h4_dark(context)?.copyWith(fontSize: 12),
              ),
              SPACING_SMALL_HEIGHT,
              Row(
                children: [
                  const Icon(
                    Icons.timer_outlined,
                    size: 15,
                    color: APP_LIGHT_GREY,
                  ),
                  Text(
                    ' Duration 20 Mins',
                    style: h4_dark(context)?.copyWith(fontSize: 12),
                  )
                ],
              ),
              SPACING_VSMALL_HEIGHT,
              Row(
                children: [
                  const Icon(
                    Icons.amp_stories_outlined,
                    size: 15,
                    color: APP_LIGHT_GREY,
                  ),
                  Text(
                    ' Total Average Fees #9,999',
                    style: h4_dark(context)?.copyWith(fontSize: 12),
                  )
                ],
              ),
              SPACING_VSMALL_HEIGHT,
              Text(
                'About',
                style: h4_dark(context)?.copyWith(color: DARK_BLUE),
              ),
              SPACING_VSMALL_HEIGHT,
              Text(
                'From cardiovascular health to fitness,flexibility,balance,stress relief,better sleep,increased cognitive peformance,and more, you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp.',
                style: h4_dark(context)?.copyWith(fontSize: 11),
              ),
              SPACING_SMALL_HEIGHT,
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'See More',
                  style: h4_dark(context)?.copyWith(color: BLUE),
                ),
              )
            ],
          ),
        ),
      );

  Widget _imageContainer({required BuildContext context}) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: CONTAINER_COLOR),
        child: Column(children: [
          SizedBox(
            height: 300,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                    itemCount: controller.topTrendingList.length,
                    controller: controller.pageController,
                    onPageChanged: (page) {
                      controller.activePage.value = page;
                    },
                    pageSnapping: true,
                    itemBuilder: (context, index) => ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: LocalAssetImage(
                            assetPath: controller.topTrendingList[index],
                            height: 150,
                            width: DEVICE_WIDTH,
                            boxFit: BoxFit.cover,
                          ),
                        )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SmoothPageIndicator(
                    controller: controller.pageController,
                    count: controller.topTrendingList.length,
                    effect: const WormEffect(
                        dotWidth: 8,
                        dotHeight: 8,
                        dotColor: APP_LIGHT_GREY_INPUT_FIELD,
                        activeDotColor: WHITE),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.download,
                  color: APP_LIGHT_GREY,
                ),
                const Icon(
                  Icons.save,
                  color: APP_LIGHT_GREY,
                ),
                const Icon(
                  Icons.favorite_border,
                  color: APP_LIGHT_GREY,
                ),
                const Icon(Icons.fullscreen),
                const Icon(Icons.start),
                GestureDetector(
                    onTap: () async {
                      await Share.shareWithResult('''
```Top Trending Item```
_Checkout this awesome jobs in *App*_
''');
                    },
                    child: const Icon(Icons.share)),
              ],
            ),
          )
        ]),
      );

  Widget _ratingBarContainer({required BuildContext context}) => Row(
        children: [
          const Icon(
            Icons.save,
            color: BLUE,
            size: 20,
          ),
          SPACING_VSMALL_WIDTH,
          Text(
            '1034',
            style: h4_dark(context),
          ),
          SPACING_VSMALL_WIDTH,
          const Icon(
            Icons.favorite_border,
            color: BLUE,
            size: 20,
          ),
          SPACING_VSMALL_WIDTH,
          Text(
            '1034',
            style: h4_dark(context),
          ),
          SPACING_VSMALL_WIDTH,
          Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: CONTAINER_COLOR),
            child: RatingBarIndicator(
              itemCount: 5,
              rating: 4,
              itemPadding: const EdgeInsets.symmetric(horizontal: 3),
              itemSize: 15,
              itemBuilder: (context, i) => const Icon(
                Icons.star,
                color: BOTTOM_BAR_COLOR,
              ),
              unratedColor: WHITE,
            ),
          ),
          SPACING_VSMALL_WIDTH,
          Text(
            '3.2',
            style: h4_dark(context)?.copyWith(color: BLUE),
          ),
        ],
      );
}
