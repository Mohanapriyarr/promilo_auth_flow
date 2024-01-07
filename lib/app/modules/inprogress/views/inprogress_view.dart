import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/inprogress_controller.dart';

class InprogressView extends GetView<InprogressController> {
  const InprogressView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Inprogress',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
