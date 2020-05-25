import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import 'package:planstraw/models/CommonModel.dart';
import 'package:planstraw/models/FanartModel.dart';

class CommonService {
  String baseUrl = 'https://kitsu.io/api/edge';
  String headerType = 'application/vnd.api+json';

  Future<List<CommonModel>> getDetail(int limit, String type, String page) async {
    var url = getUrl(limit,type,page);

    Dio dio = new Dio();

    dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);


    dio.options.headers['content-Type'] = headerType;
    dio.options.headers["accept"] = headerType;

    var res = await dio.get(url,options: buildCacheOptions(Duration(hours: 5),maxStale: Duration(days: 2)));
    if (res.statusCode == 200) {
      Map<String, dynamic> obj = jsonDecode(res.data);
      List<dynamic> body = obj['data'];
      List<CommonModel> animes = body
          .map(
            (dynamic item) => CommonModel.fromJson(item),
          )
          .toList();
      return animes;
    } else {
      print(res.statusCode);
      print(res.data);
      return List<CommonModel>();
    }
  }

  String getUrl(int limit,String type, String page) {
    switch (type) {
      case 'trending':
        return '${baseUrl}/trending/${page}?limit=${limit}';
      case 'current':
        return '${baseUrl}/${page}?filter[status]=${type}&page[limit]=${limit}&sort=-user_count';
      case 'upcoming':
        return '${baseUrl}/${page}?filter[status]=${type}&page[limit]=${limit}&sort=-user_count';
      case 'rated':
        return '${baseUrl}/${page}?page[limit]=${limit}&sort=-average_rating';
      case 'popular':
        return '${baseUrl}/${page}?page[limit]=${limit}&sort=-user_count';
      default:
        return '';
    }
  }

  Future<FanartModel> getImages(CommonModel item) async {
    FanartModel fa = FanartModel(poster: null, backDrop: null, still: null);
    fa.poster = item.posterImage;
    fa.still = item.backgroundImage;
    fa.backDrop = item.backgroundImage;
    return fa;
  }
}
