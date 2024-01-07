import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mac_task/app/data/utils/color_utils.dart';
import 'package:mac_task/app/data/utils/constant_utils.dart';
import 'package:mac_task/app/modules/account/views/account_view.dart';
import 'package:mac_task/app/modules/description/views/description_view.dart';
import 'package:mac_task/app/modules/home/views/home_view.dart';
import 'package:mac_task/app/modules/inprogress/views/inprogress_view.dart';

import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  const BottomNavBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _mainChild(context: context)),
    );
  }

  Widget _mainChild({required BuildContext context}) => Obx(
        () => Column(
          children: [
            Obx(() => Expanded(
                child: controller.currentIndex.value == 0 ||
                        controller.currentIndex.value == 1 ||
                        controller.currentIndex.value == 3
                    ? const InprogressView()
                    : controller.currentIndex.value == 4
                        ? const AccountView()
                        : controller.isDescription.isTrue
                            ? const DescriptionView()
                            : const HomeView())),
            BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: BOTTOM_BAR_COLOR,
              unselectedItemColor: APP_LIGHT_GREY,
              selectedLabelStyle: h4_dark(context)?.copyWith(fontSize: 12),
              unselectedLabelStyle: h4_dark(context)?.copyWith(fontSize: 12),
              items: controller.navBarItem,
              onTap: (value) {
                print('ontap index $value');
                controller.currentIndex.value = value;
                controller.isDescription.value = false;
              },
            )
          ],
        ),
      );
}
