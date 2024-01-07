import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mac_task/app/data/api.dart/login_api.dart';
import 'package:mac_task/app/data/utils/constant_utils.dart';
import 'package:mac_task/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController userNameTextController = TextEditingController();
  final FocusNode userNameFocusNode = FocusNode();
  final GlobalKey<FormState> userNameFormKey = GlobalKey();

  final TextEditingController passwordTextController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  final GlobalKey<FormState> passwordFormKey = GlobalKey();

  final hashValue = ''.obs;

  final isRememberMe = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> submitBtnOnTap() async {
    bool isAllFieldsValidated = validateEachFields();
    if (!isAllFieldsValidated) return;

    var appleInBytes = utf8.encode(passwordTextController.text);
    final value = sha256.convert(appleInBytes);
    hashValue.value = value.toString();
    final response = await loginAPI(
        username: userNameTextController.text, password: hashValue.value);
    if (response == null) {
      return;
    }
    Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
  }

  bool validateEachFields() {
    if (!userNameFormKey.currentState!.validate()) {
      Scrollable.ensureVisible(userNameFormKey.currentContext!,
          duration: FIVE_HUNDRED_MIL, curve: Curves.fastOutSlowIn);
      userNameFocusNode.requestFocus();
      return false;
    }
    if (!passwordFormKey.currentState!.validate()) {
      Scrollable.ensureVisible(passwordFormKey.currentContext!,
          duration: FIVE_HUNDRED_MIL, curve: Curves.fastOutSlowIn);
      passwordFocusNode.requestFocus();
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
