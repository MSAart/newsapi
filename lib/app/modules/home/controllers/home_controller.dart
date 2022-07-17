import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapi/app/models/news_model.dart';
import 'package:newsapi/app/modules/home/providers/news_provider.dart';

import '../../../data/config/showSnackBar.dart';

class HomeController extends GetxController {
  final newsProvider = Get.find<NewsProvider>();

  RxList<Articles> _news = <Articles>[].obs;
  RxInt pageNum = 1.obs;

  bool isSwitched = false;
  RxInt _currentIndex = 0.obs;
  RxInt get currentIndex => _currentIndex;
  RxList get news => _news;
  RxBool _isNoLoadMore = false.obs;
  bool get isNoLoadMore => _isNoLoadMore.value;
  RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  RxString cName = ''.obs;
  RxString country = ''.obs;
  RxString source = ''.obs;
  RxString category = ''.obs;
  RxString findNews = ''.obs;

  // Function item length
  int getItemLength() {
    if (_isNoLoadMore.value == true) {
      return _news.length;
    }
    return _news.length + 1;
  }

  // Function origin
  void fetchNews({bool refresh = false}) {
    if (refresh == true) {
      _isNoLoadMore.value = false;
      pageNum.value = 1;
      _news.clear();
      cName.value = '';
      category.value = '';
      source.value = '';
      findNews.value = '';
    }
    _isLoading.value = true;
    newsProvider.getNews(pageNum.value).then((NewsModel res) {
      _isLoading.value = false;
      if (res.articles!.isEmpty) {
        _isNoLoadMore.value = true;
      }
      if (res.articles!.isNotEmpty) {
        pageNum++;
        _news.addAll(res.articles!);
      }
    }).onError((error, stackTrace) {
      showSnackBar(error, onButtonClick: () {});
    });
  }

  // Function Country
  void fetchNewsCountry(String country, {bool refresh = false}) {
    if (refresh == true) {
      _isNoLoadMore.value = false;
      pageNum.value = 1;
      _news.clear();
      category.value = '';
      source.value = '';
      findNews.value = '';
    }
    _isLoading.value = true;
    newsProvider
        .getNewsCountry(pageNum.value, country: country)
        .then((NewsModel res) {
      _isLoading.value = false;
      if (res.articles!.isEmpty) {
        _isNoLoadMore.value = true;
      }
      if (res.articles!.isNotEmpty) {
        pageNum++;
        _news.addAll(res.articles!);
      }
    }).onError((error, stackTrace) {
      showSnackBar(error, onButtonClick: () {});
    });
  }

  // Function Category
  void fetchNewsCategory(String category, {bool refresh = false}) {
    if (refresh == true) {
      _isNoLoadMore.value = false;
      pageNum.value = 1;
      _news.clear();
      cName.value = '';
      source.value = '';
      findNews.value = '';
    }
    _isLoading.value = true;
    newsProvider
        .getNewsCategory(
      pageNum.value,
      category: category,
    )
        .then((NewsModel res) {
      _isLoading.value = false;
      if (res.articles!.isEmpty) {
        _isNoLoadMore.value = true;
      }
      if (res.articles!.isNotEmpty) {
        pageNum++;
        _news.addAll(res.articles!);
      }
    }).onError((error, stackTrace) {
      showSnackBar(error, onButtonClick: () {});
    });
  }

  // Function Source
  void fetchNewsSource(String source, {bool refresh = false}) {
    if (refresh == true) {
      _isNoLoadMore.value = false;
      pageNum.value = 1;
      _news.clear();
      cName.value = '';
      category.value = '';

      findNews.value = '';
    }
    _isLoading.value = true;
    newsProvider
        .getNewsSource(
      pageNum.value,
      source: source,
    )
        .then((NewsModel res) {
      _isLoading.value = false;
      if (res.articles!.isEmpty) {
        _isNoLoadMore.value = true;
      }
      if (res.articles!.isNotEmpty) {
        pageNum++;
        _news.addAll(res.articles!);
      }
    }).onError((error, stackTrace) {
      showSnackBar(error, onButtonClick: () {});
    });
  }

  // Fucntion Search
  void fetchNewsFind(String searchKey, {bool refresh = false}) {
    if (refresh == true) {
      _isNoLoadMore.value = false;
      pageNum.value = 1;
      _news.clear();
      cName.value = '';
      category.value = '';
      source.value = '';
    }
    _isLoading.value = true;
    newsProvider
        .getNewsfind(
      pageNum.value,
      searchKey: searchKey,
    )
        .then((NewsModel res) {
      _isLoading.value = false;
      if (res.articles!.isEmpty) {
        _isNoLoadMore.value = true;
      }
      if (res.articles!.isNotEmpty) {
        pageNum++;
        _news.addAll(res.articles!);
      }
    }).onError((error, stackTrace) {
      showSnackBar(error, onButtonClick: () {});
    });
  }

  void clear() {
    cName.value = '';
    category.value = '';
    source.value = '';
    findNews.value = '';
  }

  changeTheme(value) {
    Get.changeTheme(value == true ? ThemeData.dark() : ThemeData.light());
    isSwitched = value;
    update();
  }

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }
}
