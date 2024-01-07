import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mac_task/app/data/utils/color_utils.dart';
import 'package:mac_task/app/data/utils/constant_utils.dart';
import 'package:mac_task/app/routes/app_pages.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
        onTap: () => Get.offAllNamed(Routes.LOGIN),
        child: Container(
          padding: PAD_20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: DARK_BLUE),
          child: Text(
            'Logout',
            style: h4_dark(context)?.copyWith(color: WHITE),
          ),
        ),
      ),
    ));
  }
}
