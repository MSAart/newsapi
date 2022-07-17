import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newsapi/app/data/constant/color_constant.dart';
import 'package:newsapi/app/data/constant/textstyle_constant.dart';
import 'package:newsapi/app/modules/home/components/side_drawer.dart';

import '../components/loading_view.dart';
import '../components/notification_update.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawwer(),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Habarkula',
          style: Poppins15B,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.clear();
              controller.fetchNews(refresh: true);
              controller.update();
            },
            icon: Icon(Icons.refresh),
          ),
          GetBuilder<HomeController>(
            builder: (controller) => Switch(
              value: controller.isSwitched == true ? true : false,
              onChanged: (value) => controller.changeTheme(value),
              activeColor: ancentColor,
              activeTrackColor: Colors.white,
            ),
          )
        ],
      ),
      body: Obx(
        () => Container(
          padding: EdgeInsets.all(10),
          child: controller.news.isEmpty
              ? LoadingView()
              : NotifcationUpdate(controller: controller),
        ),
      ),
    );
  }
}
