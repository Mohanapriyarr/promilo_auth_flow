import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mac_task/app/common_views/common_divider.dart';
import 'package:mac_task/app/common_views/input_field.dart';
import 'package:mac_task/app/common_views/local_asset_image.dart';
import 'package:mac_task/app/common_views/single_row_text.dart';
import 'package:mac_task/app/common_views/title_n_sub_title.dart';
import 'package:mac_task/app/data/functions/field_validations.dart';
import 'package:mac_task/app/data/utils/color_utils.dart';
import 'package:mac_task/app/data/utils/constant_utils.dart';
import 'package:mac_task/app/data/utils/image_utils.dart';
import 'package:mac_task/app/data/utils/string_utils.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _mainChild(context: context),
        ),
      ),
    );
  }

  Widget _mainChild({required BuildContext context}) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                PROMILO,
                style: h3_dark(context)
                    ?.copyWith(color: BLACK, fontWeight: FontWeight.bold),
              ),
              SPACING_MEDIUM_HEIGHT,
              Text(
                WELCOME_BACK,
                style: h3_dark(context)
                    ?.copyWith(color: DARK_BLUE, fontWeight: FontWeight.bold),
              ),
              SPACING_MEDIUM_HEIGHT,
              TextFieldBox(controller: controller),
              SPACING_SMALL_HEIGHT,
              _buttonContainer(context: context),
              SPACING_MEDIUM_HEIGHT,
              const CommonDivider(text: 'or'),
              SPACING_MEDIUM_HEIGHT,
              _socialLoginContainer(context: context),
              SPACING_MEDIUM_HEIGHT,
              _businessUser(context: context),
              SPACING_MEDIUM_HEIGHT,
              Text(
                BY_CONTINUE_TO_AGREE,
                style: h4_dark(context),
              ),
              RichText(
                  text: TextSpan(
                      text: PROMILOS,
                      style: h4_dark(context),
                      children: [
                    TextSpan(
                        text: TERMS_N_CONDITIONS,
                        style: h4_dark(context)?.copyWith(color: BLACK))
                  ]))
            ],
          ),
        ),
      );

  Widget _buttonContainer({required BuildContext context}) =>
      GetBuilder<LoginController>(
        id: 'updateButton',
        builder: (controller) => GestureDetector(
          onTap: () => controller.submitBtnOnTap(),
          child: Container(
            width: DEVICE_WIDTH,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: BLUE),
                color: controller.passwordTextController.text.isEmpty ||
                        controller.userNameTextController.text.isEmpty
                    ? BLUE_WITH_OPACITY
                    : BLUE),
            child: Text(
              SUBMIT,
              style: h4_dark(context)
                  ?.copyWith(color: WHITE, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
  Widget _socialLoginContainer({required BuildContext context}) => const Row(
        mainAxisAlignment: MAIN_AXIS_CENTER,
        children: [
          LocalAssetImage(
            assetPath: GOOGLE_ICON,
            height: 30,
            width: 30,
            boxFit: BoxFit.contain,
          ),
          SPACING_SMALL_WIDTH,
          LocalAssetImage(
            assetPath: LINKEDIN_ICON,
            height: 30,
            width: 30,
            boxFit: BoxFit.contain,
          ),
          SPACING_SMALL_WIDTH,
          LocalAssetImage(
            assetPath: FB_ICON,
            height: 30,
            width: 30,
            boxFit: BoxFit.contain,
          ),
          SPACING_SMALL_WIDTH,
          LocalAssetImage(
            assetPath: INSTAGRAM_ICON,
            height: 30,
            width: 30,
            boxFit: BoxFit.contain,
          ),
          SPACING_SMALL_WIDTH,
          LocalAssetImage(
            assetPath: WHATSAPP_ICON,
            height: 30,
            width: 30,
            boxFit: BoxFit.contain,
          ),
        ],
      );
  Widget _businessUser({required BuildContext context}) => Column(
        children: [
          const SingleRowText(
              title: BUSINESS_USER, subTitle: DONT_HAVE_AN_ACCOUNT),
          SPACING_VSMALL_HEIGHT,
          SingleRowText(
            title: LOGIN_HERE,
            subTitle: SIGNUP,
            style: h4_dark(context)?.copyWith(color: BLUE),
          ),
        ],
      );
}

Widget LoginCommonField(
  BuildContext context, {
  required String label,
  required TextEditingController textEditingController,
  required FocusNode focusNode,
  required String hintText,
  Icon? prefixIcon,
  Icon? suffixIcon,
  bool? readOnly,
  TextCapitalization textCapital = NONE,
  bool obscureText = false,
  required bool needNext,
  required TextInputType keyboardType,
  dynamic Function(String)? onFieldSubmitted,
  String? Function(String?)? validator,
  final Function()? suffixIconTap,
  final Function(String)? onChanged,
}) {
  return Column(
    mainAxisSize: MAX,
    crossAxisAlignment: CROSS_AXIS_START,
    children: [
      Text(
        label,
        style: h4_dark(context)?.copyWith(color: DARK_BLUE, fontSize: 14),
      ),
      SPACING_VVSMALL_HEIGHT,
      InputField(
        textEditingController: textEditingController,
        focusNode: focusNode,
        textCapital: textCapital,
        keyboardType: keyboardType,
        textInputAction: needNext ? INPUT_NEXT : INPUT_DONE,
        hintText: hintText,
        readOnly: readOnly ?? false,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        suffixIconTap: suffixIconTap,
        onChanged: onChanged,
      ),
    ],
  );
}

class TextFieldBox extends StatelessWidget with FieldValidaion {
  final LoginController controller;
  const TextFieldBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: controller.userNameFormKey,
          child: LoginCommonField(context,
              label: SIGN_IN_TO_CONTINUE,
              textEditingController: controller.userNameTextController,
              focusNode: controller.userNameFocusNode,
              hintText: ENTER_EMAIL_MOB,
              onFieldSubmitted: (value) => controller.update(['updateButton']),
              onChanged: (value) {
                controller.update(['updateButton']);
              },
              needNext: true,
              validator: (no) =>
                  emptyValidation(no, 'Please Enter Mobile Number'),
              keyboardType: TextInputType.text),
        ),
        SPACING_VVSMALL_HEIGHT,
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            SIGNIN_WITH_OTP,
            style: h4_dark(context)?.copyWith(color: BLUE),
          ),
        ),
        Form(
          key: controller.passwordFormKey,
          child: LoginCommonField(context,
              label: PASSWORD,
              textEditingController: controller.passwordTextController,
              focusNode: controller.passwordFocusNode,
              hintText: ENTER_PASSWORD,
              needNext: false,
              onFieldSubmitted: (value) => controller.update(['updateButton']),
              onChanged: (value) {
                print('object');
                controller.update(['updateButton']);
              },
              validator: (no) => emptyValidation(no, 'Please Enter Password'),
              keyboardType: TextInputType.text),
        ),
        Row(
          children: [
            Obx(
              () => Checkbox(
                  value: controller.isRememberMe.value,
                  activeColor: BLUE,
                  onChanged: (value) {
                    controller.isRememberMe.value =
                        !controller.isRememberMe.value;
                  }),
            ),
            Text(
              REMEMBER_ME,
              style: h4_dark(context),
            ),
            SPACER,
            Text(
              FORGET_PASSWORD,
              style: h4_dark(context)?.copyWith(color: BLUE),
            )
          ],
        ),
      ],
    );
  }
}
