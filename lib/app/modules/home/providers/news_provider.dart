import 'package:get/get.dart';
import 'package:newsapi/app/models/news_model.dart';

import '../../../data/config/errorhandling_server.dart';
import '../../../data/config/interceptor_server.dart';
import '../../../data/config/logger.dart';
import '../../../data/constant/utils.dart';

class NewsProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    allowAutoSignedCert = true;
    httpClient.baseUrl = 'https://newsapi.org';
    httpClient.timeout = const Duration(milliseconds: 40000);
    httpClient.addRequestModifier((request) {
      return requestInterceptor(request);
    });
  }

  Future<NewsModel> getNews(int page) async {
    final response = await get(
      '/v2/top-headlines?',
      query: {
        'page': '$page',
        'country': 'id',
        'pageSize': '10',
        'apiKey': apiKey,
      },
    );
    try {
      logger.i(response.body);
      return NewsModel.fromJson(response.body);
    } catch (e, s) {
      logger.e('fetchNews API', e, s);
      if (response.hasError) {
        return Future.error(ErrorHandling(response));
      } else {
        return Future.error(ErrorHandling(e.toString()));
      }
    }
  }

  Future<NewsModel> getNewsCountry(int page, {String? country}) async {
    final response = await get(
      '/v2/top-headlines?',
      query: {
        'page': '$page',
        'pageSize': '10',
        'country': country,
        'apiKey': apiKey,
      },
    );

    try {
      logger.i(response.body);
      return NewsModel.fromJson(response.body);
    } catch (e, s) {
      logger.e('fetchNews API', e, s);
      if (response.hasError) {
        return Future.error(ErrorHandling(response));
      } else {
        return Future.error(ErrorHandling(e.toString()));
      }
    }
  }

  Future<NewsModel> getNewsCategory(int page, {String? category}) async {
    final response = await get(
      '/v2/top-headlines?',
      query: {
        'page': '$page',
        'pageSize': '10',
        'category': category,
        'apiKey': apiKey,
      },
    );

    try {
      logger.i(response.body);
      return NewsModel.fromJson(response.body);
    } catch (e, s) {
      logger.e('fetchNews API', e, s);
      if (response.hasError) {
        return Future.error(ErrorHandling(response));
      } else {
        return Future.error(ErrorHandling(e.toString()));
      }
    }
  }

  Future<NewsModel> getNewsSource(int page, {String? source}) async {
    final response = await get(
      '/v2/top-headlines?',
      query: {
        'page': '$page',
        'pageSize': '10',
        'sources': source,
        'apiKey': apiKey,
      },
    );

    try {
      logger.i(response.body);
      return NewsModel.fromJson(response.body);
    } catch (e, s) {
      logger.e('fetchNews API', e, s);
      if (response.hasError) {
        return Future.error(ErrorHandling(response));
      } else {
        return Future.error(ErrorHandling(e.toString()));
      }
    }
  }

  Future<NewsModel> getNewsfind(int page, {String? searchKey}) async {
    final response = await get(
      '/v2/top-headlines?',
      query: {
        'page': '$page',
        'pageSize': '10',
        'q': searchKey,
        'apiKey': apiKey,
      },
    );

    try {
      logger.i(response.body);
      return NewsModel.fromJson(response.body);
    } catch (e, s) {
      logger.e('fetchNews API', e, s);
      if (response.hasError) {
        return Future.error(ErrorHandling(response));
      } else {
        return Future.error(ErrorHandling(e.toString()));
      }
    }
  }
}
