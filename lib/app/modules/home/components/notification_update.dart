import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapi/app/modules/home/views/webnews_view.dart';
import '../controllers/home_controller.dart';
import 'loading_view.dart';
import 'news_view.dart';

class NotifcationUpdate extends StatelessWidget {
  const NotifcationUpdate({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollNotification) {
        if (scrollNotification.metrics.pixels ==
            scrollNotification.metrics.maxScrollExtent) {
          if (controller.isNoLoadMore == false) {
            if (controller.isLoading == false) {
              if (controller.cName != '') {
                controller.fetchNewsCountry(controller.country.value);
              } else if (controller.category != '') {
                controller.fetchNewsCategory(controller.category.value);
              } else if (controller.source.value != '') {
                controller.fetchNewsSource(controller.source.value);
              } else if (controller.findNews.value != '') {
                controller.fetchNewsFind(controller.findNews.value);
              }
            }
          }
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: () async {
          if (controller.cName != '') {
            controller.fetchNewsCountry(controller.country.value);
          } else if (controller.category != '') {
            controller.fetchNewsCategory(controller.category.value);
          } else if (controller.source.value != '') {
            controller.fetchNewsSource(controller.source.value);
          } else if (controller.findNews.value != '') {
            controller.fetchNewsFind(controller.findNews.value);
          }
        },
        child: ListView.builder(
            itemCount: controller.getItemLength(),
            itemBuilder: (BuildContext context, int index) {
              if (index < controller.news.length) {
                return NewsView(
                  newsModel: controller.news[index],
                  onTap: () {
                    Get.to(() => WebNewsView(
                        url: controller.news[index].url,
                        source: controller.news[index].source.name));
                  },
                );
              } else {
                return LoadingView();
              }
            }),
      ),
    );
  }
}
