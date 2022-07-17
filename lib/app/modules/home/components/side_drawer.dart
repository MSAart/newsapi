import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapi/app/data/constant/textstyle_constant.dart';
import 'package:newsapi/app/data/constant/utils.dart';
import 'package:newsapi/app/modules/home/components/drop_downlist.dart';
import 'package:newsapi/app/modules/home/components/text_field.dart';
import 'package:newsapi/app/modules/home/controllers/home_controller.dart';

import '../../../data/constant/color_constant.dart';

class SideDrawwer extends StatelessWidget {
  SideDrawwer({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 60.0),
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10),
            child: GetBuilder<HomeController>(builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.cName != ''
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Selected :'),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Text(
                                'Country : ${controller.cName}',
                                style: Poppins12R,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: 10,
                  ),
                  controller.category != ''
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Selected :'),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Text(
                                'Category : ${controller.category}',
                                style: Poppins12R,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
            }),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: TextFieldCustom(
                      controller: controller,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(30, 45),
                      primary: ancentColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    child: Icon(Icons.search_outlined),
                    onPressed: () {
                      controller.fetchNewsFind(
                          refresh: true, controller.findNews.value.toString());
                      Get.back();
                    })
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ExpansionTile(
            title: Text(
              'Country',
              style: Poppins12R,
            ),
            children: [
              for (int i = 0; i < listOfCountry.length; i++)
                dropDownList(
                  call: () {
                    controller.country.value = listOfCountry[i]['code']!;
                    controller.cName.value =
                        listOfCountry[i]['name']!.toUpperCase();
                    controller.fetchNewsCountry(
                        refresh: true, controller.country.value);
                    Get.back();
                  },
                  name: listOfCountry[i]['name']!.toUpperCase(),
                )
            ],
          ),
          ExpansionTile(
            title: Text(
              'Category',
              style: Poppins12R,
            ),
            children: [
              for (int i = 0; i < listOfCategory.length; i++)
                dropDownList(
                  call: () {
                    controller.category.value = listOfCategory[i]['code']!;
                    controller.fetchNewsCategory(
                        refresh: true, controller.category.value);
                    Get.back();
                  },
                  name: listOfCategory[i]['name']!.toUpperCase(),
                )
            ],
          ),
          ExpansionTile(
            title: Text(
              'Channel',
              style: Poppins12R,
            ),
            children: [
              for (int i = 0; i < listOfChannel.length; i++)
                dropDownList(
                  call: () {
                    controller.source.value =
                        listOfChannel[i]['code'].toString();
                    controller.fetchNewsSource(
                        refresh: true, listOfChannel[i]['code'].toString());
                    Get.back();
                  },
                  name: listOfChannel[i]['name']!.toUpperCase(),
                )
            ],
          ),
          ListTile(
            title: Text(
              'Back',
              style: Poppins12R,
            ),
            onTap: () => Get.back(),
          )
        ],
      ),
    );
  }
}
