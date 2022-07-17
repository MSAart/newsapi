import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/app/data/constant/color_constant.dart';
import 'package:newsapi/app/data/constant/textstyle_constant.dart';
import 'package:newsapi/app/models/news_model.dart';

class NewsView extends StatelessWidget {
  final Articles newsModel;
  final onTap;

  NewsView({Key? key, required this.newsModel, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3.0,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: (newsModel.urlToImage == null)
                  ? CachedNetworkImage(
                      imageUrl: 'assets/images/no-image.png',
                      imageBuilder: (context, imageProvider) => Image(
                        image: imageProvider,
                      ),
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Center(
                          child: Image.asset(
                        'assets/images/no-image.png',
                        height: 100,
                        // width: 50,
                      )),
                    )
                  : CachedNetworkImage(
                      width: double.infinity,
                      //height: 100,
                      imageUrl: newsModel.urlToImage!,
                      imageBuilder: (context, imageProvider) => Image(
                        image: imageProvider,
                      ),
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: ancentColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                  (newsModel.source == null) ? '' : newsModel.source!.name!,
                  style: Poppins12M.copyWith(color: Colors.white)),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text((newsModel.title == null) ? '' : newsModel.title!,
                style: Poppins12B.copyWith(color: Colors.black)),
            Text((newsModel.description == null) ? '' : newsModel.description!,
                style: Poppins12L.copyWith(color: Colors.black))
          ],
        ),
      ),
    );
  }
}
