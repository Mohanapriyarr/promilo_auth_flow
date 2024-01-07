import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mac_task/app/data/utils/string_utils.dart';
import 'package:mac_task/app/modules/home/views/home_view.dart';
import 'package:mac_task/app/modules/inprogress/views/inprogress_view.dart';

class BottomNavBarController extends GetxController {
  final currentIndex = 2.obs;
  final navBarItem = <BottomNavigationBarItem>[].obs;

  final navViewItem = [].obs;
  final isDescription = false.obs;
  @override
  void onInit() {
    navBarItem.value = const [
      BottomNavigationBarItem(label: HOME, icon: Icon(Icons.home)),
      BottomNavigationBarItem(label: PROLET, icon: Icon(Icons.window)),
      BottomNavigationBarItem(
          label: MEETUP, icon: Icon(Icons.handshake_outlined)),
      BottomNavigationBarItem(
          label: EXPLORE, icon: Icon(Icons.create_new_folder_sharp)),
      BottomNavigationBarItem(
          label: ACCOUNT, icon: Icon(Icons.account_circle_sharp)),
    ];
    navViewItem.value = [
      const InprogressView(),
      const InprogressView(),
      const HomeView(),
      const InprogressView(),
    ];
    super.onInit();
  }
}
